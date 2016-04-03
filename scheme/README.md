# Scheme Fundamentals (in LilyPond)

This main bookpart covers the use of Scheme in LilyPond documents.  While not
claiming to be a proper computer science textbook it *does* aim at giving a
thorough introduction in the Scheme language, but strictly from the perspective
of LilyPond users.

To make that possible it turned out to be necessary to somehow “mix” the
discussion of the layers of Scheme as a language and the integration of Scheme
in the LilyPond document structure.  While it is acceptable to explain some
fundamental concepts independently from LilyPond most of the more involved
techniques can only be fruitfully discussed in the actual context of LilyPond,
especially the constructions such as *music functions* that are specific to
LilyPond.

The separation of a body of “core” Scheme concepts from “advanced” interaction
with Scheme is to some extent arbitrary and may be subject to change in the
course of the evolution of this book.  However, there are aspects that we
consider to be basic skills for extending LilyPond with Scheme, while others are
much more optional.
