---
title: "Andirika Map: An OSM instance on my intranet"
date: 2026-07-26T08:22:53+08:00
draft: false
author: Lemuria
slug: "andirika-map"
---

Today, this 2026-07-20, I am happy to announce the success of my efforts to get a fairly modern version of the OpenStreetMap Rails port up and running.

{{< figure src="/img/20260726-serenta.png" width="100%" >}}
*Welcome to Serenta!*

First of all, some background. OpenGeofiction is a fictional mapping website. Fictional map websites are everywhere, but OGF is unique in its level of detail. Fictional maps either have breadth or width; that is simply the limitation of drawing on paper. You can have a map of a house, or a continent, but you'll always make a tradeoff between depth and breadth.

However, this tradeoff doesn't last long when you introduce the *HRATE*: the *High-Resolution Alternative to Earth*. This term was [invented](https://wiki.geofictician.net/wiki/index.php/HRATE) by a fellow fictional mapper and geofictician, Luciano. High breadth and high depth is possible with OSM, and the proprietary Google Maps (if a Google engineer is ever bored enough, in theory). The tradeoff is of course the amount of programming knowledge required and the many moving parts at play.

{{< figure src="/img/20260726-bluemoon.png" width="100%" >}}

This is the city of Blue Moon, in the state of Jasmine, in the country of Andirika, which is a fictional United States-like country I have been working on in my free time. I lost ownership of the state of Ardelia on OGF, so mapping Andirika has been a nice way to unleash that desire for more American mapping. Without the constraints of Michisaukee, or the friction of resketching a half-baked Ardelia that's now split into two. (No hard feelings towards the owner of Sivalta.)

## Technical stuff
Depends on who you ask. However, I would consider it such. Getting the Docker containers up and running was somewhat easy, but it was a multi-day affair, and there weren't any long 3am debugging nights, thankfully. Working OAuth2 was of course, the primary hurdle; and so was switching from a Kosmtik renderer to Apache's mod_tile and mapnik, which was simply solved by throwing more docker-compose yamls at the problem.

Many of the GitHub repositories are (hopefully) public, so take a look!

- **Railsport**: https://github.com/a-random-lemurian/openstreetmap-website/tree/andirika-osm
- **Website**: https://github.com/a-random-lemurian/openstreetmap-tile-server/tree/andirika-osm

Rather annoyingly, OpenGeofiction doesn't make a lot of their setup documentation public; look through the window at https://wiki.opengeofiction.net/index.php/Special:AllPages?from=&to=&namespace=3006 and just imagine the contents that you will never see. So, I aim to counteract that by at least trying to publicly document what *I* do.

There are of course, reasons for why OGF may not make it public. Perhaps it's just easier for them to put documentation in the Admin: namespace, and rather reasonably that namespace is readable only by admins, and it may not be worth the extra effort to dump the documentation or at least paste it somewhere public. It's hard to tell between "this information is secret so we don't want to show it" and "we can't be bothered to make it public".

### OpenGeofiction catching up?
Wangi, one of the administrators of the site, maintains [a technical blog](https://wiki.opengeofiction.net/index.php/Forum:Announcements/The_technical_update_blog). There, he writes about the progress that he and the admin team have made towards the "refresh": a big leap towards the latest version of the programs on the OSM software stack. Alongside OpenGeofiction-specific features, such as a configuration option [to disable GPS traces](https://github.com/openstreetmap/openstreetmap-website/pull/7156).

And yet again, they speak of an "OGF-private [Forgejo](https://forgejo.org) git server" where the documentation lives.

## Long-term ideas
If only I had the balls and the programming time to do so. But these ideas could help advance the use of OSM technology for worldbuilding.

- A "multi-tenant" railsport; it's hard enough setting up one, but you only get 510,064,472 km2 of land to play with. If you have multiple fictional worlds, it would be nice to amortize the setup costs, eh? Separate tile servers, databases, and only one setup would be nice. But it would take a long time to do.
- Alternative planets. OpenStreetMap is of course, built for the Earth. Humanity hasn't colonized the Moon yet. So, OSM, and the entire rest of the software stack, will assume you're mapping Earth, or at least a ball of rock and water with the same shape as the Earth.
- If you're interested in cosplaying your local county's GIS, maybe you could even do some serious character building for your city's residents and make land surveys and ownership records for your fictional city! Bureaucracy of the highest, but most boring order.

## Lore

| | |
|---|---|
| **Name** | Federation of Andirikan States
| **Area** | **Total area**: 3 178 027.637 km<sup>2</sup>
| **Population** | **2055 estimate**: 216 902 771<br>**2050 census**: 210 151 303 
| **Capital** | Green Garden<br>46.2625°N 137.1018°W

Now for the fun part, the lore.

**Andirika**, officially the **Federation of Andirikan States**, is a country on the northwestern tip of the continent of Serenta. Andirika borders Kelsentia and Galsi to the southeast, [Serenta 002, Mexico analogue] to the south, and [Serenta 003] to the southwest. It consists of 39 states across one contiguous landmass.

Yes, the lore is unfinished.


### Differences
Andirika is inspired largely by the United States of America on Earth and the Federal States of Archanta on OpenGeofiction.
However, it diverges from both the USA and FSA in many key aspects.

Andirika, and the larger Galsi lore it exists in, is mostly set in the 2050s; or in random points from 2040 onward, depending on whatever date I use in the stories I write. There is no "present".

Authors write who and what they know; so some key differences arise between Andirika, and the United States, and the Federal States.

1. The Internet is more decentralized in 2050s Andirika than 2020s Earth. In the 2030s, centralized platforms gave way to decentralized ones, and the monopolistic behavior of Big Tech companies is somewhat toned down. No fictional analogues exist for any of Earth's major AI companies (e.g. Anthropic, ChatGPT, Moonshot) a hybrid of the 2020s [Fediverse](https://en.wikipedia.org/wiki/Fediverse) (mostly [ActivityPub](https://en.wikipedia.org/wiki/ActivityPub)) and Atmosphere ([AT Protocol](https://en.wikipedia.org/wiki/AT_Protocol); perhaps best-known through [Bluesky](https://en.wikipedia.org/wiki/Bluesky)), combined with the personal blogs of the 2010s.
2. The term "Andirika" is unambiguous in-universe, and hopefully out of universe as well. The United States of America is on the continent of North America; Canada, Mexico, Brazil, and the rest of North and South America also end up under the umbrella term of "America". The Federal States of Archanta is on the continent of South Archanta; Lutang, Deodeca, the Commonwealth of Central Archanta, Majesia, and Huaxia and the rest of North and South Archanta also end up under the umbrella term of "Archanta". It's a confusing mess. However, Andirika is on the continent of Serenta. The country is most commonly known as just Andirika, as such. Officially, it is the Federation of Andirikan States, but then again, nobody calls Russia the Russian Federation in 99% of cases.
3. Politics. American politics, as it was in the 2020s, was a major dumpster fire. Andirikan politics is somewhat chiller now in the 2050s, though the specifics of how I'll worldbuild that are low on the priority list, and so is mapping. Rather interestingly, the country's politics are the oldest aspects of the worldbuilding, as I originally created Andirika for messing around and about in some other community. Nowadays, it is a generic platform on which to write random stories and map stuff.
4. Out of universe, Andirika, and the continent of Serenta, are bigger. And of course, are entirely bound to the vision of one author with the ability and the authority to act unilaterally, unlike OpenGeofiction.

One of the major things that always bugged me about OpenGeofiction was scale. Countries tend to be smaller than their real-life counterparts, and there is a lot less size inequality (think Russia vs China, the United States, and the UK, and all the tiny other countries out there; surely someone's going to make a land area graph.. right?). This is due to a combination of many factors.

1. OpenGeofiction uses only half the space available to it. The infamous Western Continents remain and languish, never to be opened for mapping.
2. The site's administrators don't simply give out large chunks of land to anyone who asks for it, and for good reason. One person can't map Rome in a day, let alone something the size of Russia. The Federal States of Archanta is one of the largest countries on OpenGeofiction, and only because it is split into plenty of states, each an individual territory available for a mapper to claim. See [OGF's territory applications policy](https://wiki.opengeofiction.net/index.php/OpenGeofiction:Territory_application). "Currently mapped territory must be at least 50% 'full'..."
3. Filling the map isn't the point, or the goal of OpenGeofiction. It's about having fun. If the map was all full, there'd be no room to try out new things.

Now, this isn't a bad thing. The suspension of disbelief can help sometimes, but eventually there's a point where it's just not worth it to zoom into the fractal of history and account for the trillions of butterfly effect events that could make or break the plausibility of a setting. 

On my map, I have the ability to act unilaterally and as I please. The big disadvantage of course, is that I don't have the resources to make the map public, but that's very low-priority because having fun is what matters, and if I do feel ready to do so, there will be an `andirika-planet.osm.pbf` to download somewhere and you can load it in yourself if you're *that* interested.

Surprisingly though, Andirika is around 3.7 million km2, slightly larger than the Federal States of Archanta. Meanwhile, the United States sits at 9.1 million km2. Andirika was actually originally 600,000 km2 on the old QGIS map, until I scaled it up 250% to make things more "realistic" because a three-state trip was just driving across California, with that scale. The stories will need to be rewritten to get in sync, but there's no deadline for that.

## Wrapping it up
This post feels rather disorganized, but it's what I could scoop out of my brain and dump into this post today. There's no telling whether my interest in mapping the fictional Andirika will just.. wane and die, but at least on the Andirika Map, assuming I'm responsible enough with my backups and data, if I take a multi-year break from it, I won't return to a yellow Andirika. (On OpenGeofiction, a "yellow" territory, marked well.. yellow, on the map, means that the owner has been inactive too long and may soon lose their territory.)

## Legal
And of course, for what it's worth, if `andirika-planet.osm.pbf` ever becomes available, it will be under ODbL 1. The screenshots of the Andirika Map are of course, CC BY-SA 4.0, and from software subject to whatever license `openstreetmap-website` uses.


---

*Lemuria eventually decided to publish this post on 2026-08-01.*
