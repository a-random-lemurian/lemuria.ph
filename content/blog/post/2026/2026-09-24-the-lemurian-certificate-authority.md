---
title: "The Lemurian Certificate Authority's key hierarchy for 2026 and beyond"
date: 2026-09-24T09:00:46+08:00
author: Lemuria
slug: "the-lemurian-certificate-authority"
archives: ["2026"]
---

The Lemurian Certificate Authority is almost certainly not going to end up in the Mozilla root program, as it holds the same weight as one's personal PGP keys, but in the interest of transparency, I've decided to release significant portions of its hierarchy online. This will help with verification of any of my future outputs, just in case.

* https://static.lemuria.ph/lemuria_certs-2026-09-24.tar.gz
* https://static.lemuria.ph/lemuria_certs-2026-09-24.zip

For the truly paranoid, downloading this will piggyback off the PKI already in place with the major web browsers, especially with Let's Encrypt, which is what this website uses.
It's also good to be honest that none of these private keypairs were born on a Hardware Security Module.

## What will these be used for?
While the most common usage of these certs is to secure traffic on the Lemurian Intranet, you probably aren't going to be logging onto the Lemurian Intranet anytime soon.

The PQ and SLH-DSA roots, alongside my personal PGP key, will be used to verify things I make, where signing becomes especially important.
Such as software, critically important public statements, and LCT-01 data.
It's another layer of cryptography on top of the fact that I already GPG-sign all my commits to this repo.
For a long time it has been an RSA key doing the signing, but this September I switched to an SSH key for signing, and it's been a whole lot faster.
Ed25519 is also a wonderful algorithm and it's more modern than ancient RSA.

### Classical root
`Lemuria_Root_A3_Elizabeth.crt`

Old faithful, Lemuria Root A3 'Elizabeth', generated in February 2026. While it expires in 2066, it's likely to die much earlier than that as Shor is coming, fast; and so should our post-quantum roots.

### PQ Root
`Lemuria_PQ_Root_A5_Helena.crt`
`Lemuria_PQ_Root_A5_Helena.ElizabethCrossSign.crt`
`Lemuria_PQ_Root_A5_01_White_Circles.crt`

Helena: the successor to Elizabeth. A5 'Helena' is an ML-DSA-87 keypair, and so is its intermediate, A5/01 'White Circles' is a fellow ML-DSA-87 intermediate.

Here's a key remembrance I recently did: https://static.lemuria.ph/key_rememberances/white_circles/2026/2026-09-24-White-Circles-remembered.txt

A key remembrance is simply signing something with the key to keep the cached knowledge of how to sign it fresh and hot.

### SLH-DSA
`Lemuria_SLH-DSA_Doc_Sign_Root_S1_Lorna.crt`
`Lemuria_SLH-DSA_Doc_Sign_Root_S1_01_Elisenne.crt`

SLH-DSA is a far more conservative post-quantum algorithm. It piggybacks off the well-proven security of cryptographic hash functions like SHA-256, so it should hopefully work even if cryptographers manage to break ML-DSA-87.

### C2PA 
`Lemuria_C2PA_Root_A3_C1_Helenas_Blue_Room.crt`
`Lemuria_C2PA_Signer_A3_C1_01_Blooming_Heather.crt`

For use in the LCT-01 of the future, and so much more. It's mostly been intranet signatures, but public signatures might arise soon.

C2PA, or Content Credentials, are a standardized way to cryptographically sign what digital assets have been through, such as the camera it was taken on, the edits the newsroom made to improve technical quality, etc.

At the LCT-01 we use it to cryptographically say an image depicts a specific species, and 

We've kept these images on the intranet as we simply don't redistribute holotypes at all, lest we get smited by the DMCA, but anyone sifting through our hard drives in the future will at least be able to verify the cryptograhy under it all.

### Timestamps 
`Lemuria_Timestamp_Root_T1_New_Stream_Schedule.crt`
`Lemuria_Timestamp_Intermediate_T1_01_Chronos.crt`

For timestamps. What else can I say?

### My GitHub key
`Lemuria_Github_Key.crt`

And here's my GitHub key, wrapped in all the X.509 bureaucracy.

## Exclusions
This isn't the entire tree by any means, some exclusions were made, but it should be a formidable enough part of the tree such that third parties can reliably verify Lemurian outputs.

## Etymologies
They're all exercises for the reader.
