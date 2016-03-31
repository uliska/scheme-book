# WYSIWYG vs. Compiling

The fundamental distinguishing characteristic of the software ecosystem we are
discussing here, from which many other differences derive, is that it is not
built on a WYSYWIG-type working environment. This is an important concept for
text-based editing and workflow tools in general, and thus we should cover a
basic introduction to what it means to be a WYSIWYG editor, to be non-WYSIWYG,
and what follows from using one or the other. We won't go too deeply in depth
here: the function of the present chapter is to give an introduction to the
concepts involved, so that we might build on them when discussing more complex
working environments in later chapters.[^1]

## What You See Is What You Get

**TODO**: this is all too long. Fewer words, more pictures!

Most software tools with which the average user might be familiar fall into a
class known as WYSIWYG, which stands for "what you see is what you get"
(pronounced "whizzy-wig"), and is fairly self-explanatory. The editing program --
and this goes for text editors like Microsoft Word as well as music editors like
Finale or Sibelius -- is designed so that the user sees a representation of the
file being edited that closely resembles how it would look in printed form. We
don't normally think about *why* an editing program might be designed this way,
because there are layers of visual metaphor built into the program itself, and
very likely the operating system on which it runs, that support this mode of
interaction with the file.

These layers have been built up over years, sometimes decades, to reinforce the
user experience[^2] of the computer and its software as a solid, tactile set of
objects, most of which would be familiar to a worker in a typical office
environment. This is why files are organized into "folders," why dropdown menus
behave in a way that resembles pulling open a drawer, why the delete function
relocates the file to a graphic of a waste-basket (which then appears to grow
full), and so on. The WYSIWYG editor is designed to reinforce the this user
experience, in that the user has the sensation of manipulating things like
layout, fonts, and the structure of the text, and doing all of this directly.

There's nothing wrong with such systems; indeed, it was the advent of such
**graphical user interfaces** (GUIs) that led to a revolution in desktop
publishing. It was a great achievement of software design that extremely
powerful tools for controlling digital layout and design tools were made
accessible to users with little programming experience.

There are, however, also consequences to using software built around these
principles. Using a WYSIWYG editor involves trade-offs, and it's important to
know what they are, and to avoid taking the implications of your working
environment for granted. To use a particularly-designed tool is to work in a way
that that tool was made to reinforce, and doing so uncritically misses the
opportunities available with other tools.

To use one example, of particular importance to our project: WYSIWYG music
editors place a premium on rendering speed, such that changes the user makes are
almost instantaneously visible on the screen. To achieve this they have to skip
over a lot of processing of the of the music's layout (as it would slow down
rendering speeds unacceptably), leading automatically to music layout being less
optimal than it might be in the hands of a skilled human engraver.  
**TODO** Urs knows more about this than I do. Care to add some detail?

A second consequence is that the files themselves are often saved in a format
that only the editing program itself can properly interpret. In order to achieve
optimum rendering speed (among other considerations), the way the program might
store a given file (particularly for custom layout changes such as moving a
system of music downwards to make space for annotations for to improve the
æsthetic appearance of the score) is done to optimize how the *program*, not
necessarily the user, can process quickly. This leads to files for WYSIWYG music
editing programs being stored in what is called "machine-readable" form, which
very often looks like gibberish to a human reader. It doesn't matter to a user
that never has to read those files outside of the program itself, but can lead
to serious difficulties for a user who might need to edit a file written with a
version of the program that she no longer has installed.

## What You See Is What You Mean: Compiling

We need not spend too much time advocating the virtues of of non-WYSIWYG
editors; but they offer a number of significant advantages, particularly when
dealing with collaborative projects. These types of editors are often called
WYSIWYM, a deliberate play on WYSIWYG standing for "what you see is what you
*mean*" (pronounced "whizzy-wim"). It's considerably easier to understand how
such an editor might work if we talk first about WYSIWYM editors for text, where
the concepts are more accessible and we don't have to cover the sometimes
cryptic shorthand one uses when writing text-based music files.

In a WYSIWYM text editor, no effort whatsoever is made to present the user with
how the document being edited might actually look in the printed form. Instead,
text simply flows until a paragraph break, extending to the edge of the window
(so no margins are shown). In fact, layout and format changes are made directly
to the data file itself, and look the same regardless of which program opens
them. In such an editor, there is no button to make a text bold; if I want the
text to appear bolded, I surround it with two asterisks, like this: `**bold
text**`. If I want to add a heading (for a chapter division, for example) I
precede it with a `#` sign.

This is what's known as a *markdown* language, in that specific characters
signal to the program that eventually builds the file into print format that it
should apply certain formatting to that text when compiling it. This is the
second key distinction: in a WYSIWYM editor, the actual text content is kept
separate from the process of formatting (hence the emphasis on "what you mean":
if you aren't distracted by working with how you want the text to look while
editing it, you can concentrate on writing what you *mean*). A key concept, once
which we shall cover repeatedly in this book, is the separation of *content*
from its *presentation*. In a WYSIWYM editor, I am writing instructions to the
compiler, which it then takes to produce the print output in a second stage.

This brings us to confronting what is a common stumbling block for working with
programs like this: when you write a good chunk of material for your document,
you don't see the results immediately. Instead, you have to tell the program --
or even a separate program entirely -- to *compile* the file you've just saved,
which then produces your output. We'll cover how this works in Lilypond in the
[next chapter](production-cycle.md); in a text editor, this is a separate
program that produces a print-ready output. This file is usually a PDF file, but
it could also be an e-book file, or a web page, or some other format.

An excellent program for text editing, built on tools that we'll be covering
here as well (namely the [LaTeX](../latex/README.md) system), is called "Lyx."
It's designed to provide an accessible interface for editing documents, while
still providing access to all the various commands that one can use within the
LaTeX environment. It provides a very rough approximation of some basic
formatting (like paragraph breaks, headings of different sizes, etc.), but a lot
of elements of a document work very differently. For example, in the image
below, you can see a graphic as part of the document. However, in the file, that
graphic is contained in a box, which the editor can collapse so that it doesn't
appear in the editor at all. Further, that image might not even appear at that
point in the text: the compiler might be given instructions to allow the graphic
to "float," so that it might be moved one or several pages away to improve
layout.

**TODO**: add picture of a LyX editing window

A particular strength of LaTeX editors -- very important to anybody who's had to
write long academic papers -- is handling citations. In the LaTeX environment,
citations are given in a shorthand (so that I might write something like
`smith1996molecular` in the text), telling the compiler to insert the citation
with that label at that point. However, the interpreter can also be instructed
to insert "ibid." automatically for repeat citations, sparing the author
considerable work (anyone who has had to go through thousands of citations and
check that every "ibid." is correct after adding a citation in between will
realize what a hassle this is). LaTeX and Lyx allow the author to move
paragraphs -- or even sections and chapters -- around within the document,
without breaking the citations or footnotes.

The key point here is that a WYSIWYM editor is designed to allow the author to
give instructions to build the document, and then to allow the compiler to put
the document itself together on its own. This frees the author to do many things
with the document that aren't even possible with a WYSIWYG editor, not only in
terms of creative formatting (in Lyx, for example, it's entirely possible to
refer to footnotes earlier or later in the text, or to have footnotes of
footnotes, or to change some footnote numbers to images, etc. etc.), but also to
work on larger projects involving collaborative workflows with dozens or even
hundreds of individuals working on different parts of the document
simultaneously.

---

[^1]:
There is an excellent little essay available that gives a more in-depth (and
entertaining) overview of WYSIWYG environments, text editors, programming, user
interfaces, operating systems, and Linux by Neal Stephenson called ["In the
Beginning … Was the Command Line"](http://www.cryptonomicon.com/beginning.html).
It's a very eye-opening read if you haven't studied the underlying design
philosophy of your computer's OS before.

[^2]:
It might seem a bit dry to refer to "users" and "the user experience" in the
context of creative fields like music and writing, but it achieves a broader
significance when we think of musicians as "users" as well: in a way, they are
interacting with the score in a similar way to how a computer user might
interact with a software program. Both are actively interacting with the tools
before them to produce new, unique experiences. In that way, we can think of the
tools and their users at many different levels of the production chain, and
avoid some of the unfortunate social hierarchies that come into play when we
describe, for example, a performing musician as an "interpreter."
