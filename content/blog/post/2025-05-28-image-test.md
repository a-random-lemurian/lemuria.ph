---
author: Lemuria
date: "2025-05-28T06:35:42Z"
title: Image test - stalking a cat
slug: image-test
---


And now to test how well Jekyll will do with images.

Stalking a cat.

<img src="{{"/img/IMG_7292.JPG" | relative_url }}" width="100%">

It however, took some HTML magic.

{% raw %}
```html
<img src="{{"/img/IMG_7292.JPG" | relative_url }}" width="100%">
````
{% endraw %}

I wish there was a more convenient way to do this.

And, I just realized that the theme didn't impose any size limits on images, so I had to manually add width="100%". Thank $GENERIC_RELIGIOUS_FIGURE that I can just embed HTML if needed in Markdown on this site. Would pave the way for dynamic posts in the future, not that I have the JavaScript knowledge necessary to pull off such a stunt anyway.

The image is eight megabytes in size. I apologize in advance for overloading your poor internet connection.
