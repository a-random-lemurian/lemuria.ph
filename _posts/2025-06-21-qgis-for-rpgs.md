---
layout: post
title: "QGIS is surprisingly good at 2D starmaps"
author: Lemuria
date: 2025-06-21 22:04:31 +0800
---

QGIS is free and open-source GIS software. Typically, the G would stand for "geographic", but there's nothing saying we can't redefine the G to make it mean "galactographic" instead. While in the real world, galaxies are 3D, and QGIS is meant for flat 2D maps and not complex 3D objects like the Milky Way, many science fiction universes use a 2D map anyway, since it's convenient and doesn't require users to learn any strange or funky controls.

## Data sources
QGIS projects are spread across multiple files; datasources, and the qgz file. The qgz file contains the filenames of datasources and styling rules for how the data from the datasources should be styled. Typically, for a map, it is advisable to put all the files in a single folder, so that you can zip it up for sharing if need be, or for easier transfer. Your mileage may vary.

For databases, I recommend the geopackage format. There are many ways to store data, but the geopackage format offers many advantages. It is an SQLite3 database file, a good file format. If you know SQL, you can run advanced queries on your data to get more insights into your fictional world.

While not exclusive to geopackages, GIS in general can store more fields, allowing for richer maps. In the case of starmaps, data such as faction ownership, the star's spectral classification, size, and whatever other fields may be relevant to your setting, can be included, and incorporated into the style.

The minimum viable space map will have two layers; a layer for stars and a layer for hyperlanes.

You also don't have to do it all at once; you can modify the fields of the tables as your mechanics or lore evolve, but do be warned that it will be very tedious to "backfill" those fields for hundreds of stars and factions at the same time.

## Tips for making maps
This is not going to go in-depth on how to install QGIS, but if you have QGIS and you've figured out how to install it, it's relatively easy to begin mapping. I will list out some tips that you should stick to when mapping, however.

1. Use a black background. Users love dark mode, and space is dark anyway, so it wouldn't feel right to look at a light background.
2. Add text buffers to labels, and set the buffer colors to the background color. If a star name overlaps with a white hyperlane, readability issues ensue.
3. For hyperlanes, don't use

### Map types
Mechanics are different between RPGs. One mechanic that is especially relevant to these maps is FTL travel. Here are two types of models depending on the restrictions on the path on which ships may travel.

1. The "fixed link" model, which means that ships can only travel between stars over links; there is no "jump drive" nor any way of bypassing these lanes.
2. The "ocean" model, which means that ships can go anywhere at FTL speed, and are not confined to any such links.

Settings can also embrace a "hybrid" model, where FTL theoretically works using the ocean model, but for example, has terrain so unpredictable that over the centuries, multiple fixed links have been discovered in the unpredictable terrain through brute-force. (handwave explanations may vary between universes.)

Or in terminology more understandable to 21st century humans, you can only go on highways and roads; your car is not an off-road vehicle, and you should absolutely not go off-road. Whereas in our world, drones and all manner of aircraft follow the "ocean" model.

If you do not use the fixed link model, ignore the third tip about hyperlanes.

### Zoom levels
A particular style you design may excel at high zoom levels, but the lower the zoom level goes, the more messier it may be. Scale-dependent visibility can solve this. The map has general labels at low zoom levels showing regions, while zooming in shows more detailed information such as star systems and the factions that own them.

## Creating tiles for the web
Another even bigger advantage that QGIS offers is its ability to turn your map into tiles, allowing users to zoom in and scroll, giving your map more room for detail and preventing your users from running out of RAM and suffering computer explosions due to attempts to open your 47-megabyte PNG file. Very few RPGs will last long enough that this becomes a problem, but if you're dreaming big or have hundreds of stars, it can add up quickly.

This of course has the obvious setback that you need a website and domain, but those things are cheap. Find a host that works for you.

Additionally, the tiles can get quite large; as of writing this in the morning of 2025-06-22, the tiles directory on my web server reported that it was 100MB large. You could of course render on-demand, but that is significantly more complicated and will cause high CPU usage, which a cheap VPS like the one I have can't handle.

I have a project model for my map that selects the same settings everytime (a project model is the only way to save settings; it is akin to a macro for doing macros), which makes the map nice and consistent. The extent (the rectangle box that tells the renderer what areas it should cover) will grow with the map, and that is the only setting I manually configure everytime.

## What map am I talking about?

The "OWOT Starmap". OWOT isn't an RPG, but rather, a website. I made a starmap with the names of people on the website and other random names, an art project of sorts. View it at <https://lemuria.ph/owot/starmap>. Most of the references are inside jokes and extremely hard to comprehend, but feel free to dig deeper and investigate at your leisure. This post focuses more on the technical aspects of using QGIS, and the minimal client-side application that makes viewing the map possible, and not the worldbuilding behind the map you see.

While not my first map; this was the first one that I deployed online in a slippy map format.

<img src="{{"/img/2025-06-22.owot-cat.png" | relative_url }}" width="100%">

Notice how the "Lemurian Territories" and "Eastern Lemuria" are the largest areas on the map.

Also, there's a cat, since the people of OWOT love cats.

For a list compiled on 2025-06-22 of how many stars each faction owned, enjoy the following SQL:

```sql
select    factions.name, count(*) as stars
from      star 
left join factions on star.primary_owner_id = factions.fid
group by  factions.name
order by  stars desc;
```

And the results of the SQL:

```
name                                                   stars
-----------------------------------------------------  -----
Lemuria                                                108  
Independent                                            50   
Our World of Text                                      34   
Fern Organization                                      33   
Northeast Navigation Committee                         26   
Krastandar Federation                                  17   
Polonez Territory                                      12   
Our World of Pixels                                    12   
Your World of Text                                     10   
Veristek Galactic                                      10   
Fox Image Stashers                                     10   
D9eoead                                                10   
Dalton Republic                                        8    
Foxlin Area                                            7    
Coalition for the Removal of Andrei from the Internet  7    
Bzuki                                                  7    
BonziWorld                                             7    
Lime Confederacy                                       6    
Peppermint Farm                                        5    
Anti-OWOT Coalition                                    5    
Sumeria                                                4    
Sleepycat                                              4    
Caltrop Memorial Conservancy                           4    
Andrei                                                 3    
Laputa Core                                            2    
Asher & Lyric                                          2   
```

(If the faction name is nil, it must be independently owned! Or more accurately, the map data provider may not have gathered enough ownership information yet.)

## Other people who have done something similar
Not mine. Obligatory "I do not endorse the content of the following links" disclaimer.

- [map.champlain.group](https://map.champlain.group/) is a slippy map too of the Dawn of Victory universe by the Templin Institute. They don't use QGIS, however. The background of the map is also beautiful, but it doesn't beat the utilitarianism and bare-bones minimalism of a plain black background.

## Other notes

*This was written on 2025-06-21, but only on 2025-07-01 did I actually bother to upload it to the server.*
