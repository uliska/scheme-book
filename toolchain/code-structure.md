# Code Structure

Let's have a look at another short example of LilyPond input which exposes a few
characteristics of *source code* that can be better handled with specialized
editors:


{% lilypond %}
someMusic = {
  c4 d \tuplet 3/2 {
    e f g
  } a1
}
{% endlilypond %}

### Bracket Matching

Markup and programming languages tend to use *blocks* as structural units.  

LilyPond uses pairs of curly brackets `{ }` to group and nest *expressions*, as
you can see twice in this example.  The outer expression is `someMusic = { }`,
the inner one `\tuplet 3/2 { }`. Editors can provide a number of different
tools to make handling of such brackets easier:

* Visually highlight the corresponding bracket
* Jump between beginning and end of expressions
* Select the range between brackets
* Raise a “red flag” when brackets are not balanced (i.e. the numbers of
  opening and closing brackets don't match)

### Indentation

Another aspect you can see in the example is *indentation*.  Levels of nesting
are indicated by an increasing amount of empty space (called *whitespace*) at
the beginning of the lines.  While the *compiler* does not care at all about
this visual layout of the code[^1] it greatly improves legibility for the
*human* reader. Just consider the same code without nesting (and highlighting):

```
someMusic = {
c4 d \tuplet 3/2 {
e f g
} a1
}
```

This could even be written on one line:

```
someMusic = { c4 d \tuplet 3/2 { e f g } a1 }
```

Editors can automatically indent your input while you type or fix existing code
afterwards.

### Code Folding

As files grow they can quickly become unwieldy.  *Code folding* hides and shows
blocks of code, helping you to concentrate on the parts of a file you are
actually working on.  You can see it as an equivalent to a file explorer that
hiding or displaying the content of a directory.

### Code completion

*Autocompletion* is a feature you will know from office applications:  When
starting to type a word you are prompted with a list of possible completions.
Office programs typically “learn” their list of words from the current document
and sometimes also from a dictionary.  Source code editors often provide that
feature but retrieve their suggestion lists from the used input language.  That
is, an editor can be capable of knowing exactly what input would be valid at a
given point.

{% image
  caption="Code completion in the Frescobaldi IDE" %}
  /assets/toolchain/code-completion.png
{% endimage %}

In this screenshot after entering `\slu` *Frescobaldi* suggests all the
available slur commands.  This does not only save typing and assists the user's
memory but above all it reduces the risk of typing errors.

The same screenshot also shows Frescobaldi's visualization of the folding
structure by the way.  Clicking on the `-` beside the opening bracket (in line
2) would hide the whole expression from line 2 to 10.

---

[^1]:
There *are* languages where layout and indentation make a difference to the
machine, but we are not concerned with these in the LilyPond context.

{% credits %}{% endcredits %}
