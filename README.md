# The (Plain) (Text) (And) (Music) Book

Welcome to *The (Plain) (Text) (And) (Music) Book*.  This is a collaboratively
maintained collection of resources about authoring music documents with tools
based on *processing plain text files.*  It focuses on the [GNU
LilyPond](http://lilypond.org) score writer and the
[LaTeX](http://latex-project.org) typesetting system which are based on a firm
belief in the virtues of traditional craftsmanship.  A short presentation at the
beginning of this book will show you how using these programs is a choice for
superior and truly professional tools.

Despite having a certain “oldschool” appeal working with plain text is in fact a
very modern and future-oriented approach to authoring documents and managing
data.  It can be the foundation for sophisticated and sustainable collaborative
workflows, providing an efficiency that is unimaginable with “traditional”
graphical applications.

As the concepts of *plain text* and *modular toolchains* may be new to potential
users a [first main part](toolchain/index.html) will introduce them gently and
show you how the bits and pieces work together.  While you should not miss this
opportunity to get a deeper understanding you may prefer to dive right in and start with the step-by-step introduction in our [Hello World](lilypond/hello-world.html) walkthrough.

The main parts of the book will cover LilyPond, LaTeX and workflows using
[version control](https://en.wikipedia.org/wiki/Version_control).  Their goal is
providing in-depth and slow-paced introduction and *tuition* where the official
documentation is forced to being a concise *reference*.

Started in Summer 2015 this “book” is not conceived as a coherent text aiming at
comprehensive coverage.  Instead it is a collection of resources where chapters
and sections are basically self-contained units.  However, living in a
pre-existing book structure (as opposed to the much looser categories of our
[blog](http://lilypondblog.org)) they will hopefully start building up
coherence.

{% credits %}{% endcredits %}

# Extending LilyPond

It is well-known that LilyPond's output can be tweaked to the least detail.  But
in fact LilyPond's behaviour can be modified and extended right through to its
inner gears!  However, such power and flexibility comes at a cost, namely
learning the
[Scheme](https://en.wikipedia.org/wiki/Scheme_%28programming_language%29)
programming language and its integration with LilyPond.  

In a way, extending Lilypond with Scheme is like open heart surgery, and it is
definitely not necessary to be able to *program* in order to *use* LilyPond for
engraving scores.  But at the same time the user will get in touch with the
basic language constructs at every level of work, so it is always a good idea to
familiarize oneself with some characteristics of Scheme.

Unfortunately the [official
documentation](http://www.lilypond.org/doc/v2.18/Documentation/extending/index.html)
is not exactly helpful in smoothly introducing beginners to the world of Scheme.
And particularly the integration of Scheme in LilyPond can be a real challenge
to get comfortable with.  Therefore this part of the book provides a slow-paced
and thorough introduction to the basics of Scheme, aiming at giving the reader a
firm understanding and fundamental knowledge.  Having studied the following
chapters should give the reader a robust foundation for further learning.

{% credits %}{% endcredits %}
