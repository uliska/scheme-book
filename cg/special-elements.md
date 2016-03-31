# Special Page Elements

There are a number of items that can or have to be inserted on pages, most of
them producing some partially generated additional information.  Generally they
are inserted using GitBook's “block” syntax `{% BLOCKNAME %}{% endBLOCKNAME %}`,
optionally making use of the block's content and/or its arguments.  Please make
sure you have read this page before adding new pages.

## Content / Authoring Info

### Author(s)

Each page can have a (single) block naming the main author(s) of the
page/chapter and (optionally)  give additional information about the authorship.

As each page will also have a "Credits" box giving automatic information the
“Authors” box may only be entered at the beginning of more important pages, e.g.
the first page of a series of subpages.

If a page is intended to have such a box

```
{% authors "John Doe", "Foo Bar"}<optional comment>{% endauthors %}
or
{% authors "John Doe"}{% endauthors %}
```

should be placed immediately after the main heading.  This will produce a block
listing the main author(s) (determining proper wording depending on the number
of authors).  If that block has some content this is printed as additional
information on the authoring inside the block.

**NOTE:** Markdown formatting is not possible in that content part.  If you need
to insert hyperlinks (e.g. to reference documentation, discussion or a blog post)
you will have to write explicit HTML here.

**NOTE:** Currently (as of gitbook 2.1.0) there is a bug that prevents the last
argument (i.e. author) to be taken into account (see the
[issue report](https://github.com/GitbookIO/gitbook/issues/804)).  This has been
fixed and will be part of the next release.  Please ignore this and do *not* add
an empty dummy author at the end of the list, as the issue will go away
automatically and we would have to update the items manually otherwise.
The current page is an exception to demonstrate the cause.

### Credits Info

Each page should print an info box giving detailed credits about all editors and
authors of the page.  This information is generated automatically, and there is
nothing to be configured about it.  Unfortunately the box can't be inserted
automatically (yet), therefore authors should literally place

```
{% credits %}{% endcredits %}
```

at the bottom of each page.
