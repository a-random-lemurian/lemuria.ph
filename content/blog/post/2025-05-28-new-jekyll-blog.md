---
author: Lemuria
date: "2025-05-28T00:05:10Z"
title: New Jekyll blog
slug: new-jekyll-blog
---

It's quite overcomplicated, but I somehow managed to cobble together a Jekyll theme that looks just like the root of lemuria.ph, and upload this to the server.

I now have a place where I can write random stuff to link to should I find myself with the desire to type.

If you're on this website, welcome, and thank you for coming along for the ride.

## How did I do this?

I had been thinking of doing such a thing for an amount of time, but only now have I found myself in posession of a VPS server and the time to do so. Being bored with not much else to do, I decided, why not?

To start, I wanted my blog to stand out from the rest, and be consistent with the overall look of lemuria.ph, so I went about creating a custom Jekyll theme.

With four hours of work, primarily spent experimenting with things, copying a fair amount of content from [Minima](https://github.com/jekyll/minima), another theme. It was mostly HTML and a small amount of CSS; the biggest part of what was copied from Minima was the CSS for syntax highlighting, not that I have any blog posts here with code samples.

I then started writing random things and sifting through my computer for blurbs of text to test out the look and feel, and got to somewhere I was satisfied with.

Those blurbs weren't fit for publication; I'd rather keep them to myself, so I wrote this blurb.

Then it was a simple matter of building the website and using `rsync` to transfer the entire _site directory to my server's webroot.

## Why Jekyll?

Because I like it, and it was a fair amount of fun to work on the lemuria.ph jekyll theme.

WordPress is way too boring and is also bloated. I opened a WordPress blog post about how WordPress is bloated, and it is what TV Tropes would call a Self-Demonstrating Article - through the 1MB transfer (uncompressed, includes images) figure in dev tools.

## Contacting me about this blog

Feel free to scream at me in the `##lemuria` channel on [libera.chat](https://web.libera.chat), or at `lemuria0685` (ID `446492687013773323`) on Discord. I should get to adding more methods to contact me online somewhere, but this will work for now.
