# Images

There is an `image` block element available for inserting images. In its basic
form it simply takes the image URL as its body:

```
{% image %}/assets/path/to/image.png{% endimage %}
```

Additionally it supports several optional keyword arguments: `caption`, `href`,
`width` and `height`. keyword arguments have to be separated by commas.

If a *caption* is added it will be centered below the image.  If a *href* is
present the image will get a link to the given full-size image - and the caption
is extended with a “click to enlarge” link.  *width* and *height* can be used to
specify the size of the image, just like their HTML attribute models.

```
{% image
   caption="This is the caption",
   href="/assets/path/to/fullsize-image.pdf",
   width="75%" %}
  /assets/path/to/image.png
{% endimage %}
```

The spacing of this doesn't matter but it seems useful to use a layout like this
to make the block readable.

**FIXME:** The href link doesn't work properly yet.
See [Issue #4](https://git.openlilylib.org/oll/book/issues/4)

{% credits %}{% endcredits %}
