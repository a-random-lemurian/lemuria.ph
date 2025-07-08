---
author: Lemuria
date: "2025-06-06T15:18:42Z"
title: Meowing at people over UDP
slug: meow-protocol
---

I've developed a new work-in-progress protocol for hosts to meow at each other over UDP port 32390. A reference implementation in Go, alongside a Lua dissector for looking at Meow Protocol packets in Wireshark, are available at [a-random-lemurian/meow-protocol](https://github.com/a-random-lemurian/meow-protocol) on GitHub.

I created the protocol out of sheer boredom and the desire to combine my technological inclination with my inclination for and obsession with cats, which extends to stalking the local neighborhood cats for the sole purpose of photographing them. I haven't been able to take any new pictures yet, due to staying at home and sitting at the computer the whole time, but I'm sure I'll touch some grass once more.

Anyways, I've mirrored a snapshot of what the README.md file looked like below, for more redundancy, and in case you don't want to click on the GitHub link. And, this blog post would be too short without it, so I needed to pad it a little more.\

Have fun.

## Protocol description

The Meow Protocol is a revolutionary new protocol that allows hosts to meow at each other over the Internet.

The Meow Protocol runs over UDP at port 32390 (`ca7` in hexadecimal with a 0 at the end, since 3239 is already assigned by IANA).

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

## Format

A Meow Protocol header is formatted as follows:

```
     0                   1                   2                   3
     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |Version| Cute  | Message Type  |  Animal Type  |           Breed       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | NameLen       |        Sender Name                                  ...
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

Where:

`Version`, 4 bits, is the protocol version.

`C` represents `Cuteness`, 4 bits, presents information about the sender's subjective evaluation of their cuteness. If the sender is not capable of self-reflection or is non-sentient, this field is assumed to be that of the human or computer evaluating the subject on whose behalf the message was sent.

`Message Type`, 8 bits, is the message type.

`Animal Type`, 8 bits, is the type of the animal sending the Meow Protocol header. Meows are inherently associated with cats, but the animal field exists to allow other animals or biological organisms capable of imitating meows to identify themselves in a Meow Protocol header.

`Breed`, 16-bit number identifying the breed of the animal in question. It is not strictly a breed identifier however, as this field has other uses depending on the Animal Type.

`NameLen`, 8 bits, is the length of the following Sender Name field. This field MUST reflect the number of bytes in the following UTF-8 string, and MUST NOT include the NUL byte at the end.

`Sender Name` is the name of the entity meowing. This field MUST be encoded using UTF-8. This field MUST end with a NUL byte.

## Field values
All following fields are in decimal.

### Cuteness

|---|---|
| Number | Meaning |
|---|---|
| 1 | The sender is not cute. 
| 2 | The sender is cute.
| 3 | The sender is very cute.
| 4 | The sender is extremely cute.
| 5 | The sender does not know if they are cute.
| 6 | The sender does not want to disclose if they are cute or not.
| 7 | The sender is ugly.
| 8 | The sender is extremely ugly.

### Message type

|---|---|
| Number | Meaning |
|---|---|
| 1 | Meow
| 2 | Purr
| 3 | Scratch
| 4 | Bite
| 5 | Paw at you
| 6 | Growl
| 7 | Hiss
| 200-255 | Reserved

Message type numbers from 200 to 255 MAY be used for private uses of the Meow Protocol involving animals not known to the Meow Protocol authors, or for carrying other information.

### Animal type

|---|---|
| Number | Meaning |
|---|---|
| 1 | Cat
| 2 | Human, male
| 3 | Human, female
| 4 | Human, unspecified
| 127 | Pokémon
| 200-255 | Reserved

The human fields are intended for humans with the ability to replicate meows. Because cats have "high and bright voices" according to an unknown person consulted by the Meow Protocol authors, female voices are more adept at imitating meows. Because of this, humans have three specific animal numbers.

Animal type 127 was added to the spec for an early Meow Protocol user who used the protocol to send the authors a Meow Protocol message for their favorite Pokémon.

Animal type numbers from 200 to 255 MAY be used for private uses of the Meow Protocol involving animals not known to the Meow Protocol authors, or for carrying other information.

### Breed

#### Cats

|---|---|
| Number | Meaning |
|---|---|
| 0 | Unspecified |
| 1 | Calico |
| 2 | White |
| 3 | Siamese |

#### Other animals
If the Animal type field is set to 127, the breed value MUST be the Pokédex number of the animal meowing, indexed at one. A breed value of zero MUST be interpreted as the breed not being known.

#### Human
If the animal type is set to any form of human, the breed field MUST be filled with NUL bytes.
