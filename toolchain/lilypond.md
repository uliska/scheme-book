# LilyPond Versions

The second (although the most fundamental) thing to get hold of is LilyPond
itself because this is the heart of the whole process. But LilyPond provides a
“stable” and a “development” version, so which version should be installed by
first-time users?

With GUI applications it is usually a safe bet to use the “stable” release if
you are not specifically interested in testing or even helping with development.
But there is a significant difference here. An unstable *GUI application* can
crash at any time, taking any unsaved work with it to its digital grave  - or
even worse: compromising an open document and destroying the *whole* work.  The
worst thing that can happen with an unstable *compiler* is that it doesn't
(correctly) compile your document.  And if that happens your work is not spoiled
but you can either change your files until they work again or you can switch to
another LilyPond version.  

There are a few reasons for using the stable release, but if you are not
seriously bothered by them you should continue reading about the reasons why you
should consider the development version.

#### Reasons to Use the Stable Version

* The stable version is labeled “stable” so you can expect to run into issues
  less often.  However, this has to be weighed against limitations that may have
  already been removed in the development version.
* The development version sometimes introduce changes to LilyPond's input
  language.  While there are tools that mostly automate the process of updating
  input files this may add an additional layer of complexity to your learning
  curve.
* The stable version may be the one available in your Linux distribution's
  repository.
* You start learning LilyPond for the work in a concrete project that for some
  reason prescribes the stable version.

#### Reasons to Use the Development Version

* The development version provides significant improvements over the stable
  release.
* The development version is nearly always stable enough even for professional use.
* The developers rely on people working with the development version and give
  feedback, be it through discussion and feature requests or through bug reports.
  By using the development version you can actively support LilyPond's
  development.

However, this doesn't have to be a final decision as you can switch versions at
any time.  And with a little extra work (which we won't explain in this
introduction) it is simple to have multiple LilyPond versions installed side by
side.

---

LilyPond is available for the major operating systems and most Linux
distributions have at least the stable version available in their package
repositories.  You can get the [stable](http://lilypond.org/download.html) and
the [development](http://lilypond.org/development.html) versions from their
download pages.

**Note/TODO:** We will provide more resources about getting LilyPond set up in this
book, but for now you should refer to the information found on the download
pages and the manuals ([stable](http://lilypond.org/manuals.html) and
[development](http://lilypond.org/development.html) versions).

{% credits %}{% endcredits %}
