# Understanding Scheme In LilyPond

It is well-known that LilyPond's output can be tweaked to the least detail.  But
in fact LilyPond's behaviour can be modified and extended right through to its
inner gears!  However, such power and flexibility comes at a cost, namely
learning the
[Scheme](https://en.wikipedia.org/wiki/Scheme_%28programming_language%29)
programming language and its integration with LilyPond.

In a way, extending Lilypond with Scheme is like open heart surgery, and it is
definitely not necessary to be able to *program* in order to *use* LilyPond for
engraving scores.  But even without any ambitions to “program LilyPond” it is
always a good idea to familiarize oneself with some characteristics of Scheme
because one will get in touch with it at every level.

For anybody except seasoned computer scientists this seems to be a thorny path,
for several reasons that will be somewhat outlined in the following chapters.
Unfortunately the [official
documentation](http://www.lilypond.org/doc/v2.18/Documentation/extending/index.html)
is not exactly helpful in smoothly introducing beginners to the world of Scheme.
And particularly the integration of Scheme in LilyPond can be a real challenge
to get comfortable with.  Therefore this book provides a slow-paced and thorough
introduction to the basics of Scheme, with specific concern for the LilyPond
perspective.  It is not a formal computer science textbook but rather targeted
at musicians, musicologists and music engravers who want to dig deeper than the
surface.  It tries to overcome or at least alleviate the obstacles that LilyPond
users typically face when trying to approach Scheme.

This book is *not* your one-stop shop for Scheme in LilyPond and explicitly
doesn't make further individual learning obsolete.  However, it aims at
providing a robust foundation that will make this learning more pleasant - or
possible in the first place.

This book is part of [The Plain Text And Music
Book](https://textbook.openlilylib.org).  Originally it was an integrated part,
but due to its size and weight we decided to extract it into its own book.
