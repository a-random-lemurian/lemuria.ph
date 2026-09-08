---
author: Lemuria
date: "2026-09-08"
title: How to use multiple Step CA instances to saturate your PKI with easter eggs
slug: multiple-step-cas
---

Here on the Lemurian Intranet, we have the principle that if there's a practical opportunity to add an easter egg, that opportunity should be taken. One place where this opportunity finds a home is in the humble Common Name field of an X.509 certificate. Many companies tend to pick boring names for their certificates, like `Internet Widgits Pty Ltd Root ECC DV Root 1` and `Internet Widgits Pty Ltd Root ECC DV Intermediate 1.1`, as opposed to the intranet's naming convention of names such as `Lemuria Root A3 'Elizabeth'` and `Lemuria Root A3/02 'PearlescentMoon'`. It's more fun, and we think it has the added benefit of being easier to remember. A3/02 and A3/06 are easy to mix up, but it's a lot clearer what your coworker means when "Lorna's going to be EOL next week".

Our root is the long-lived `Lemuria Root A3 'Elizabeth'`, which will last from February 14, 2026, to February 14, 2066. Forty years of life, though Elizabeth will have to retire early once the quantum computers successfully run Shor's algorithm. It's shown here in all its glory. 

```
-----BEGIN CERTIFICATE-----
MIICRTCCAeugAwIBAgIIb42XdOWIjkQwCgYIKoZIzj0EAwIwgYMxCzAJBgNVBAYT
AlBIMQ8wDQYDVQQIEwZDYXZpdGUxDTALBgNVBAcTBEltdXMxEDAOBgNVBAoTB0xl
bXVyaWExHDAaBgNVBAsTE0xlbXVyaWFuIENBIFNpZ25pbmcxJDAiBgNVBAMTG0xl
bXVyaWEgUm9vdCBBMyAnRWxpemFiZXRoJzAgFw0yNjAyMTQxODIxMDBaGA8yMDY2
MDIxNDE4MjEwMFowgYMxCzAJBgNVBAYTAlBIMQ8wDQYDVQQIEwZDYXZpdGUxDTAL
BgNVBAcTBEltdXMxEDAOBgNVBAoTB0xlbXVyaWExHDAaBgNVBAsTE0xlbXVyaWFu
IENBIFNpZ25pbmcxJDAiBgNVBAMTG0xlbXVyaWEgUm9vdCBBMyAnRWxpemFiZXRo
JzBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABLAL5zxm3jg1lHzef+xZMBpJ+1Jg
5zUKyM0rd9NJzYGTeRN40g8CeNQPUkj2CxzaejVYXAQvSqTX+16io2BSl+ajRTBD
MBIGA1UdEwEB/wQIMAYBAf8CAQMwHQYDVR0OBBYEFMt3UgrKTNmsmddxGBe8guyC
eg1GMA4GA1UdDwEB/wQEAwIBBjAKBggqhkjOPQQDAgNIADBFAiAyZaQndIz8RkBv
9+OPD3PNukooXoHM7xhO8J/vGtkqRAIhANx7kRXr6+PQxZ4MMehiqAzOCpFW0vRy
v9KiMh/kLnaS
-----END CERTIFICATE-----
```

To automate the issuance of certificates on the intranet, we make use of the open-source `step-ca`. We were doing just fine with a chain of `A3 'Elizabeth'` &rightarrow; `A3/02 'PearlescentMoon'` &rightarrow; `A3/02/02 'Gráinne Ní Riain'`, until one day we decided we needed more easter eggs. Now, certificates are being issued from these intermediates (marked with a `***`).

```
A3 'Elizabeth'
  A3/02 'PearlescentMoon'
    A3/02/02 'Gráinne Ní Riain' ***
  A3/06 'Endless Certificates'
    A3/06/03 'Free Subnets'
      A3/06/03/01 'Freya Winters' ***
      A3/06/03/02 'Katya Reynolds' ***
```

Most companies would probably benefit from the simplicity of:
```
Example Company Root CA 2026-2035
  Example Company Intermediate CA 2026-2029 ***
```

but we like easter eggs on our network, which is why we prefer our current hierarchy.

{{< figure src="/img/2026/09-08-intranet-crtsh.png" width="100%" >}}
*This is an intranet instance of `crt.sh`.*

Now, the problem with our setup is that `step-ca` only supports one intermediate for every single provisioner. Their enterprise product probably supports multiple intermediates, however, we don't have enough money.

Because we want to feel like Let's Encrypt without having to be Sisyphus lifting LE's [Boulder](https://github.com/letsencrypt/boulder) up Certificate Hill, we had to improvise, by running a Caddy, three `step-ca` servers, and praying for the best.

The entire setup interfaces with our intranet DNS and IPAM, and we're handwaving that away, but it is as simple as this Caddyfile.

```caddy
{
	acme_ca https://freya-winters.acme.ca.lem/acme/acme/directory
	email caddy-ca@lemuria02.net.lem

	admin [fc00:8940:1c48:1500::c0:3500]:20190
	default_bind fc00:8940:1c48:1500::c0:3500

	log default {
		level INFO
		output file caddy-runtime.log {
			roll_size 100mb
			roll_keep 0
		}
		format json
	}

	http_port 80
	https_port 443
}

(log_conf) {
	log {
		format json
		output file caddy-access.log {
			roll_size 100mb
			roll_keep 0
		}
	}
}

directories.acme.ca.lem {
	import log_conf

	tls {
		issuer acme {
			disable_tlsalpn_challenge
		}
	}

	bind directories.acme.ca.lem

	respond / "securing the Lemurian intranet, one cert at a time."

	reverse_proxy https://freya-winters.acme.ca.lem https://katya-reynolds.acme.ca.lem https://grainne-ni-riain.acme.ca.lem {
		lb_policy random
	}
}
```

The meat is at the bottom, where `directories.acme.ca.lem` reverse-proxies three `step-ca` servers with their own path down the Lemurian hierarchy.

We point our clients at `directories.acme.ca.lem`, and when they do that, they get a random directory from all three CAs.

For example:
```json
{
    "newNonce": "https://freya-winters.acme.ca.lem/acme/acme/new-nonce",
    "newAccount": "https://freya-winters.acme.ca.lem/acme/acme/new-account",
    "newOrder": "https://freya-winters.acme.ca.lem/acme/acme/new-order",
    "revokeCert": "https://freya-winters.acme.ca.lem/acme/acme/revoke-cert",
    "keyChange": "https://freya-winters.acme.ca.lem/acme/acme/key-change"
}
```

`freya-winters` can either be `katya-reynolds` or `grainne-ni-riain` depending on how Caddy's source of RNG is feeling today. Once a client gets a random directory, Caddy's job is done and the client directly interacts with the ACME server they get, and the certificate machine chugs along until either someone runs Shor's algorithm on our PKI or we feel like adding more easter egg names and preemptively switch out a certificate.

And it's lightweight too! Each `step-ca` only needs 13 megabytes of RAM.

As for the configuration we feed to every `step-ca` server, it is a version of this:

```json
{
	"root": "/home/user/Code/numbered/0242-step-multica/prod/stepdata/authorities/freyawinters/certs/root_ca.crt",
	"federatedRoots": null,
	"crt": "/home/user/Code/numbered/0242-step-multica/prod/stepdata/authorities/freyawinters/certs/intermediate_ca.crt",
	"key": "/home/user/Code/numbered/0242-step-multica/prod/stepdata/authorities/freyawinters/secrets/intermediate_ca_key",
	"address": "[fc00:8940:1c48:1500::ca:1000]:443",
	"insecureAddress": "",
	"dnsNames": [
		"freya-winters.acme.ca.lem"
	],
	"logger": {
		"format": "json"
	},
	"db": {
		"type": "postgresql",
		"dataSource": "REDACTED",
		"database": "stepca",
		"badgerFileLoadingMode": ""
	},
	"authority": {
		"provisioners": [
			{
				"type": "ACME",
				"name": "acme",
				"claims": {
					"enableSSHCA": true,
					"disableRenewal": false,
					"allowRenewalAfterExpiry": false,
					"disableSmallstepExtensions": false
				},
				"challenges": ["http-01", "dns-01"],
				"options": {
					"x509": {},
					"ssh": {}
				},
				"policy": { "x509": { "allowWildcardNames": true } }
			}
		],
		"template": {},
		"claims": {
			"minTLSCertDuration": "48h0m0s",
			"maxTLSCertDuration": "336h0m0s",
			"defaultTLSCertDuration": "334h0m0s",
			"disableRenewal": false,
			"allowRenewalAfterExpiry": false
		},
		"backdate": "1m0s",
		"policy": { "allowWildcardNames": true }
	},
	"tls": {
		"cipherSuites": [
			"TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
			"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
		],
		"minVersion": 1.2,
		"maxVersion": 1.3,
		"renegotiation": false
	},
	"commonName": "Step Online CA"
}
```

As for how we got that intranet `crtsh` to work, we went through way too many hoops for that, and our sysadmin Lemuria doesn't remember even half the hoops he went through to set it up. There's a small chance he might bother to write a blog post on it, though.

## Who are Freya, Katya, and Gráinne?
Another thing our intranet operator likes to do is brag about why a specific feminine given name is in the PKI hierarchy, so we'll let him explain it here.

* Freya Winters is a fictional character from the free-and-open-source video game *Endless Sky*, created by Michael Zahniser and first released in June 2015. The community has since taken over its development and nobody knows what Zahniser is up to in 2026 but we hope he's alive and well.
  * There's also a British author who lives on Earth and has the same name as her, but we swear on our hard drives she just has the same name through sheer coincidence. That's what happens when you live on a planet of 8 billion people.
* Katya Reynolds is a fictional character too from *Endless Sky*. She ends up being a part of the Free Worlds council alongside Winters and the player character, traditionally called "First Last"
* "Endless Certificates" is simply a pun on "Endless Sky".
* "Free Subnets" is a pun on "Free Worlds".
* PearlescentMoon is an Australian *Minecraft* YouTuber, and a member of Hermitcraft.
* Elizabeth is... just a generic feminine given name. That's it. It can be a reference to whoever you like! Maybe the dead Elizabeth 2, or the countless commoners out there with Elizabeth as a middle name. (They say it's always DNS, but on your driver's license it's always Elizabeth!)

## Conclusion
Now we don't know how often our intranet users (mostly the sysadmin and his family) bother to check what certificate protected their web traffic, but it will at least make for a fun read through crt.sh logs.

# Appendix: the runbook
*And of course, here's the intranet runbook for you to adapt to your needs.*

<hr>

**Runbook**: Create a new Intermediate Certificate Authority

Set `STEPPATH`.

```sh
export STEPPATH=$(realpath stepdata)
```

Set a `CONTEXT` for future operations.

```sh
export CONTEXT=freyawinters
```

Initialize the new certificate authority with `step ca`. We will throw out the root and intermediate it generates, alongside their keys, because we are using our own certificates.

```sh
step ca init --context=$CONTEXT
```

Pick standalone for the deployment type.

The name should be `Lemurian Certificate Authority (Cert Name)`. Replace `Cert Name` with whoever we're naming the CA after.

Go to `lem-dns-zone` and assign a new subdomain under `.acme.ca.lem`.

Go to [https://netbox.lemuria02.net.lem/ipam/prefixes/75/ip-addresses/] and assign a new IPv6 address for the step-ca server to listen on.

Delete the generated root CA's keys.

```
rm stepdata/authorities/$CONTEXT/secrets/root_ca_key
```

Overwrite `stepdata/authorities/$CONTEXT/certs/root_ca.crt` with `Lemuria Root A3 'Elizabeth'`, the current long-lived root. Elizabeth will last until 2066 and she's here to stay!

Overwrite `stepdata/authorities/$CONTEXT/certs/intermediate_ca.crt` with the certificate chain to the intermediate, excluding the root certificate.

Edit `stepdata/authorities/$CONTEXT/config/ca.json`.

Set the database source to the values in `postgres_creds.json`.

Set the challenges field in the ACME provisioner to `["http-01", "dns-01"]` as Caddy hates TLS-ALPN-01.

Set these claims.
```json
		"claims": {
			"minTLSCertDuration": "48h0m0s",
			"maxTLSCertDuration": "336h0m0s",
			"defaultTLSCertDuration": "334h0m0s",
			"disableRenewal": false,
			"allowRenewalAfterExpiry": false
		},
```

Set this policy.

```json
"policy": { "allowWildcardNames": true }
```

Add an ACME provisioner to the step-ca contexts.

```
step ca provisioner add acme --type acme --context=$CONTEXT
```

Open a tmux terminal or find some other persistence mechanism for the new step-ca.
Docker, systemd, k8s, whatever works.

Start the step-ca instances.

Edit `caddy/Caddyfile` and add the new downstream step-ca to the list of reverse proxies. `round_robin` is good for less than 3 CAs, past that go to `random`.


## Where do I put this
Always use `directories.acme.ca.lem` as the ACME endpoint. The point of load-balancing is that every call to the ACME directory endpoint will return a fresh set of endpoints, meaning we get more easter eggs in the chain.

The caddy that reverse proxies `directories.acme.ca.lem` should however use a specific one or things will get too recursive.

## Verify
Make sure you are using the correct certificates!

```
step certificate inspect stepdata/authorities/$CONTEXT/certs/intermediate_ca.crt
```

## Considerations
The caddy that load-balances step-ca should be separate from the main Lemurian intranet caddy.

