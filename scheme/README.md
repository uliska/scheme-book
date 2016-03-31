# Including Scheme in LilyPond

The first thing to understand is how - on a very basic level - Scheme code can
be used in LilyPond documents.  So this is what we will first investigate.

*Note: With LilyPond 2.19.22 some *substantial* simplifications have been
introduced in how Scheme can be integrated in LilyPond code.  In case of doubt
this book will strongly prefer the *new* syntax and exclusively explain this.*

## Switching Between LilyPond and Scheme

In order to insert code in a different language the parser must discern between
the two layers, which it does through the `#` sign that marks the transition
from LilyPond to Scheme.  Concretely, whenever the parser encounters this marker
it will interpret the *immediately following expression* as Scheme code.  (One
of the following chapters will go into some detail about what an “expression” is
in Scheme.)

So to insert any Scheme expression into a LilyPond document you have to prepend
it with `#`.  The best way to understand this is to see it in action.  More or
less *any* LilyPond user will already have assigned a Scheme value to an
override:

{% lilypond %}
{
  \once \override DynamicText.extra-offset = #'(2 . 1)
}
{% endlilypond %}

The `#` tells LilyPond's parser to parse one complete Scheme expression, which
happens to be the *pair* `'(2 . 1)` (the next chapter will go into more details
about Scheme's data types.)

#### Exceptions

LilyPond very much “thinks” like Scheme, and all input will internally be
converted to Scheme.  Therefore some data types can be entered literally,
without explicitly switching to Scheme, and the following number assignments are
equivalent:

{% lilypond %}
{
  \once \override Stem.length = #7.5
  \once \override Stem.length = 7.5
}
{% endlilypond %}

The same is true for strings *(TODO: should it be explained what a ”string is?)*
that can additionally be written with or without double quotes (NOTE: in
LilyPond/Scheme strings *have* to use *double* quotes and not single quotes).
Again, the following assignments are equivalent:

{% lilypond %}
\header {
  title = #"MyPiece"
  title = "MyPiece"
  title = MyPiece
}
{% endlilypond %}

 The first one is the “regular” Scheme syntax: switching to Scheme mode, then
 writing a proper string with quotes.  The other ones are simplifications made
 possible through LilyPond's own parser.  But in all three cases the *variable*
 `title` now refers to the *string* `MyPiece`.

 There are a few other data types where this is possible, but we will discuss
 them at a later point.  For now you should only keep in mind that you have to
 use `#` to switch to Scheme syntax - but not *always*.

#### LilyPond and Scheme variables

Another thing to note is that LilyPond variables are interchangeable with Scheme
variables in LilyPond input files.  Variables can be defined using either
syntax:

{% lilypond %}
\version "2.18.0"

% define a variable using LilyPond syntax
bpmA = 60

% define a variable using Scheme syntax
#(define bpmB 72)
{% endlilypond %}

We have two variables, `bpmA` and `bpmB`, one of which has been entered as a
LilyPond, the other as a Scheme variable (we'll soon get to the “thing” with the
parens in Scheme).  But internally they are now the same kind of variable and
can be accessed in the same way:

{% lilypond %}
{
  % assign a tempo using a literal value
  \tempo 8 = 54
  R1

  % assign tempos using the variables with LilyPond syntax
  \tempo 8 = \bpmA
  R1

  \tempo 8 = \bpmB
  R1
}
{% endlilypond %}

However, as they are stored as Scheme variables internally we can also refer to
them using the Scheme syntax (i.e. switching to Scheme with `#`):

{% lilypond %}
{
   % assign tempos by referencing variables using Scheme
  \tempo 8 = #bpmA
  R1

  \tempo 8 = #bpmB
  R1
}
{% endlilypond %}

Each of these ways to access the variables will work interchangeably, and it
depends on the context which one should be used.  This flexibility may seem
confusing but it helps if you strictly remember that *all* values and variables
are maintained as Scheme structures internally and that setting and accessing
them can always be done through Scheme or LilyPond syntax.

<img src="http://lilypondblog.org/wp-content/uploads/2014/03/first-music-function1.png" alt="first-music-function-image" width="656" height="141" class="aligncenter size-full wp-image-2551" />

{% credits %}{% endcredits %}
