---
title: "Migrating to Hugo"
date: 2025-07-08T17:16:30+08:00
slug: "migrating-to-hugo"
---

I migrated to [Hugo](https://gohugo.io/). It took a while, but we made it to the other side.
This used to be a Jekyll blog, but I was enthralled by Hugo's promises of faster website builds.
The hours that went into switching to Hugo probably won't be recouped by the faster builds, but
we changed anyway and we made it, so we might as well stay here.

The migration to Hugo extends far beyond the blog; this also includes the rest of `lemuria.ph`,
not just `lemuria.ph/blog/*`.

The website loading speed won't change much; the pages have already been generated. It's as fast
as the SSDs in the Ionos datacenter, as fast as your ISP's (shitty?) router, and as fast as your
reading speed. But the build speed sure is the speed of light now!

## Bonus: Website restructuring!

The way that lemuria.ph is hosted is via a bunch of directories in `/home/lemuria/www/ph/lemuria`.
Java-like, I know. My naming convention uses underscore-prefixed folder names for anything not a 
subdomain. Since the _root folder is a git repository at present (for the older version of my
website), weirdness can happen when I want to host a certain thing under `lemuria.ph`.

And the same weirdness will still happen when I eventually copy the `public` folder that Hugo
generates on every website build to the _root folder. It wouldn't be a good thing to just delete
other projects everytime I deploy a new version.

So to this effect, I've created some `_misc` folders, and added `handle_path` directives to my
Caddyfile to handle the new paths, while keeping the links the same. This is especially important,
given that [link rot](https://en.wikipedia.org/wiki/Link_rot) is something we should be actively
fighting against. If you haven't figured out yet, I have the personality of a highly dedicated
and sometimes obsessive archivist.

## The Future

The future of the website will consist of the usual; more blog posts for random stuff in my life.
Additionally, the theme, which I built from scratch for this website, will continue to receive
more bells and whistles, and polishes.

Do stick around and check once in a while. Thank you for reading.
