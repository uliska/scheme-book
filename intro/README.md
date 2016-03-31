# LilyPond's Scheme

LilyPond uses *Scheme* as its extension language - that said, it has to be noted
that this is only half of the story.  In order not to get confused
it's crucial to have a clear idea of the actual implications.

## *What* Is Scheme?

Scheme is a programming language from the
[Lisp](https://en.wikipedia.org/wiki/Lisp_%28programming_language%29) family of
languages, which adhere to the paradigm of [functional
programming](https://en.wikipedia.org/wiki/Functional_programming).  This is
very different from the concept of [imperative
programming](https://en.wikipedia.org/wiki/Imperative_programming#History_of_imperative_and_object-oriented_languages)
which the majority of (non-professional) programmers is more familiar with and
which is present in languages like Python, JavaScript or (Visual) BASIC, Java or
the C family of languages.  This makes getting in touch with Scheme challenging
for many potential users.

## *Which* Scheme?

It is important to note that *Scheme is not (necessarily) Scheme*, as there are
many Scheme *implementations* around.  In real life this means that when you
search for “Scheme” solutions on the internet you have to expect that the
results may not be (completely) compatible with LilyPond.  If you are not fully
aware of that fact looking for help on the net can be quite off-putting.

The Scheme impementation used by LilyPond is the one included in
[Guile 1.8](http://www.gnu.org/software/guile/), which is the official application
platform and extension language of the [GNU](http://gnu.org) operating and
software system.  Therefore the official resource for any questions is the [GNU
Guile Reference
Manual](https://www.gnu.org/software/guile/docs/docs-1.8/guile-ref/), especially
the [API
reference](https://www.gnu.org/software/guile/docs/docs-1.8/guile-ref/API-Reference.html#API-Reference)
*(please note that Guile 1.8 is not the current version of Guile, so even web
searches for “Guile Scheme” may bring up incompatible results)*.  But it has to
be said that this documentation is suited rather as a *reference* if you are
already experienced with Scheme.

Apart from this the only trustworthy resources for Scheme *in LilyPond* are the
[LilyPond manual](http://lilypond.org/doc/v2.18/Documentation/extending/), this
book, tutorials on [Scores of Beauty](http://lilypondblog.org) or the
[lilypond-user](https://lists.gnu.org/mailman/listinfo/lilypond-user) mailing
list.


## *How* To Use Scheme in LilyPond?

A LilyPond user faces challenges on three levels with using Scheme in LilyPond, each of which is covered in one of the major bookparts.

The first is learning the language itself.  Experience tells that a substantial
obstacle on the thorny path is a lack in understandable documentation and
learning resources.  There seems to be a gap between people who haven't gone
through a sufficient “initiation” and those who *have* done so - and who seem to
have lost the understanding for the beginner's needs.  Therefore this book aims
at providing a slow-paced, yet thorough introduction to Scheme's elements and
concepts.  While it is not a proper computer science book it tries to focus on
the questions that confuse aspiring LilyPond users most.

The second topic is the integration of Scheme as an extension language in
LilyPond input files. This works quite smoothly because LilyPond's language
itself is parsed in a way that is very close to Scheme.  But on the other hand
this affinity can make things confusing.  We will give particular emphasis on
disentangling these things.

The third challenge is the more advanced interaction with LilyPond's internals
that is possible through Scheme.  LilyPond can reveal information about every
object's most secret properties, and the user can interact very closely with
these internals.  This is the part where the average LilyPond user tends to give
up and will even be more confused than informed by the helping hands given by
more knowledgeable people on the mailing lists.  However, this becomes much more
accessible once the user has a firm understanding of the fundamentals of Scheme
and its integration in LilyPond documents.

The following pages will give the reader an idea about the “look and feel” of
writing Scheme in LilyPond.  This will make it easier  to understand the later
sections of this book, other resources about Scheme, and solutions and comments
provided in the usual LilyPond resources.  In Scheme it is often difficult to
see the forest for the trees - or with a more specific metaphor: to see the
expression for the parentheses.  Novice users usually are overwhelmed by the
need for a different mindset while seasoned users often fail to see the needs of
those who don't have that mindset yet.



{% credits %}{% endcredits %}
