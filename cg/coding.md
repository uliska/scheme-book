# Coding / Styling

{% authors "Urs Liska", "" %}
Note, here is a dummy author to circumvent a gitbook bug.
But generally we should ignore that because the bug has already been fixed.
{% endauthors %}

Generally the book is written with an
[extended Markdown syntax](http://help.gitbook.com/format/markdown.html) as
defined by the `gitbook` tool.  One point of Markdown is that it can appropriately
be written in any text editor available, but it may nevertheless be practical
to make use of specialized tools.  We don't prescribe anything here but state
that the [Atom](https://atom.io) is quite promising.  It may be particularly
useful for authoring a GitBook because its Markdown Preview looks very much like
that of GitHub and so is quite close to our book as well.  Furthermore it is very
extensible, and it may well be that we will add packages to support special
aspects of our book one day.

We expect input files to be formatted with hard line breaks at (around) 80
characters, although we won't reject Merge Requests for this reason.  Atom has
support for this too, making it comparably convenient, see the `line-length-break`
package and the editor's soft wrap feature which complement each other.

## Customizations

We have added a number of special “styles” or “environments” to ensure consistency
throughout the book.  These can be accessed either through the inline use of HTML
classes (consistency styles defined in our CSS files) or through specific
`gitbook` templating constructs.

Please be sure to read the page about [special page elements](special-elements.html)
as there are mandatory and optional elements that you have to know about, at
least when adding new pages.

For consistent styling of textual elements we provide [character](character-styles.html)
and [block](block-styles.html) level CSS style sheets.

### LilyPond Code

There is a comprehensive stylesheet in place to format LilyPond code with syntax
highlighting.  This relies on the capabilities of
[Frescobaldi](http://frescobaldi.org) and its `python-ly` module.  To insert
LilyPond code examples you can simply insert plain text and wrap it in the
`lilypond` block construct.  For example:

```
{% lilypond %}
\version "2.18.2"

redNotes =
#(define-music-function (parser location music)
   (ly:music?)
   #{ \override NoteHead.color = #red
      #music
      \revert NoteHead.color #})

music = \relative c' {
  c4 \p \tuplet 3/2 {
    d ( e d )
  }
  \redNotes { c } |
}

\score {
  \new Staff \music
}{% endlilypond %}
```

will result in this beautifully formatted output:

{% lilypond %}
\version "2.18.2"

redNotes =
#(define-music-function (parser location music)
   (ly:music?)
   #{ \override NoteHead.color = #red
      #music
      \revert NoteHead.color #})

music = \relative c' {
  c4 \p \tuplet 3/2 {
    d ( e d )
  }
  \redNotes { c } |
}

\score {
  \new Staff \music
}
{% endlilypond %}

If it is more convenient for one reason or another you can also insert existing
HTML code that has been exported From Frescobaldi independently.  This may make
sense when you have to apply some manual tweaks that don't work properly with
the automatic styling.  If you do want to insert ready-made HTML code snippets
please ensure that:

* HTML is copied as plain text
* Only the document body is exported
* Inline styles are *not* active
* The wrapping tag is `<pre class="lilypond">`, which you can either set in
  Frescobaldi's Preferences (if using Frescobaldi > 2.18.1) or by manually
  editing the HTML.



{% credits %}{% endcredits %}
