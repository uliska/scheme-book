# Application vs. Toolchain

Today most people are used to working with *monolithic GUI applications* like
*Word* (word processor), *InDesign* (desktop publishing), *Sibelius* (music
engraving), or *Thunderbird* (email client), to name just a few examples of the
most common application types.  The LilyPond score writer on the other hand
belongs to a kind of software that adheres to a completely different approach to
document editing, namely a *text based toolchain*.

With LilyPond[^1] you basically don't interact with documents in a **G**raphical
**U**ser **I**nterface (aka “application window”) but instead you prepare an
*input file* describing the document's content textually.  Then you *invoke* the
LilyPond executable which eventually *compiles* the input to a graphical score,
typically in a PDF file.

Once you have figured out your preferred way of working you *will* have a more
integrated user experience than the above paragraph suggests.  But setting up
“LilyPond” does take a little more than installing a single application - it
requires a chain of at least three tools: a text editor, LilyPond itself, and a
viewer.  This may seem more confusing than an application window with a bunch of
menus and toolbars to click around.  But in fact it's really not that hard and
provides unique advantages through its flexibility.  Having read through this
chapter you will have a good idea of the underlying concepts and infrastructure.

---

[^1]:
The same is true for the LaTeX typesetting system but for the sake of simplicity
this chapter will concentrate on LilyPond.

{% credits %}{% endcredits %}
