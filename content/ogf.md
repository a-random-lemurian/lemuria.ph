---
author: Lemuria
title: "OpenGeofiction"
aliases:
    - /ogf.html
headLinks: |
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
 <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
---

<p><b>Lutang</b> is a Philippines-inspired country in Northern Archanta. Check it out!</p>
<div id="map"></div>
<script>
    function addmap() {
        ogf = L.tileLayer('https://tile.opengeofiction.net/ogf-carto/{z}/{x}/{y}.png', {
            name: 'mapnik', minZoom: 0, maxZoom: 19,
            attribution: 'Map data &copy; <a href=\"https://openstreetmap.org\">OpenGeofiction</a>'
        }),
            map = L.map('map').setView([0, 125], 7);
        map.addLayer(ogf);
        console.log('map loaded');
    }
    addmap();
</script>

<h2>Miscellaneous</h2>
<ul>
    <li>Latin script to Kangpatsa converter for Zhenkang</li>
    <li><a href="https://lemuria.ph/opengeofiction-americana/">OpenGeofiction Americana</a></li>
    <li><a href="https://ogf.infinatio.us">OpenGeofiction Americana - Infinatious version</a></li>
    <li><a href="https://github.com/OGFlab">OGFLab</a> - OSM technology adapted to OGF</li>
</ul>
