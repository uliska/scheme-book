# Document Production Cycles

This chapter will cover the production cycle - what we might refer to as the
"assembly line" - of documents within a text-based production environment. As
we noted in the last chapter, text-based documents, whether they result in music
or text as their final product, can nevertheless be *produced* using similar
sets of tools to control versions, check errors, and so forth. Once you have a
grasp of the *conceptual* background of text-based document creation, it becomes
easier to learn how to take advantage of some of its benefits.

**TODO**: add some graphics.

Here's a rough view of what a (very simplified) production cycle for a document
might look like:

**Edit Document** → **Store Document** → **Compile Document** → **Use Output**

Each one of those stages might use a different tool, which itself might comprise
sets of more complicated or specialized tools. But this basic model might apply
to any number of systems. For example, you might be working with a programming
language, to produce a program to run as software; in that case, your *editor*
can be a very basic program that simply allows you to type into a file, all the
way up to very complicated programs equipped with shortcuts to add commands
specific to your programming language. Your *storage medium* can be (and usually
is) some form of digital storage on your computer (such as your hard drive)[^1],
but might also be some form of online storage. How you save to either can
involve other steps, especially if you are editing collaboratively (in which
case you also need a system in place to track changes, manage many different
versions of the same file and merge them, etc.). Once you have a version of your
document that is ready for production, you run a *compiler* on it. This, too,
can be very simply designed to translate strings of text into machine-readable
form, or might be a very complex system designed to work on the document in
multiple passes, checking and re-checking the output for formatting, optimizing
the output, etc. This results in an output file, which you can then *use*. If
you were writing a software program, you now have an application that you can
run on your computer (or smartphone, or whatever). If you were producing a
document for printing, this would involve running that file on the hardware that
produces print output (such as a typesetting machine, printer, or similar).

In a **WYSIWYG** application, all of these tasks are managed in the background,
and kept largely hidden from the user. A program like *Word* stores its files in
a format that looks very different from what the user types into the keyboard,
and has specialized software to render them on-screen. In such a system, storage
and compiling are compressed into a single step, saving the document in a form
that's already designed for *Word*. When a user tells *Word* to "print" the
document, it manages the steps of formatting the document for print output in
the background as well, sending another set of data to the printer.

A modular toolchain like what we are discussing here separates out each of these
steps, allowing each step to be managed by separate software according to the
users' needs.[^2] The key concept here is that you can modify each of these
tools for specific tasks to suit your use case. You might, for example, tell the
compiler to produce output to run on a Macintosh computer in one pass, and then
tell it to compile for a smartphone on the next. A program built for one might
not run on the other, or you might specifically compile your program to run on
as many different platforms as possible. In publishing, it was very often the
case that you would compile for specific printing equipment, as each printer
accepted different sets of commands to format the output document; recent years
have seen the PDF format become a common format accepted by a range of printers
and display devices, and so many print-based compilers are designed to produce
PDF output as one of their options (and this is often seen as a safe fallback
when working with text documents among several editors, as they each might be
using a different word processor on a different operating system).

In the Lilypond ecosystem of software, Lilypond is the compiler, and runs on
text documents produced by other programs. What those programs are, and how they
interact with Lilypond, we cover in the next chapter.

---
[^1]:
Indeed, for most use cases, this stage is essentially invisible. We include it here because it becomes increasingly important when discussing collaborative projects, or any project in which tracking different versions of a file become important. It is likewise important to keep in mind, as Lilypond itself is capable of compiling multiple separate documents into a single output file, and understanding the ways it does so makes possible much more fine-tuning and flexible output.

[^2]:
In fact, the software for each of these steps - particularly within the "open-source" software ecosystem - is also built using the same sort of toolchain. The compiler, for example, was originally written as a text file, run on a predecessor compiler, then *that output* was used on the original file a second time, producing another compiler. This process is known as "bootstrapping," optimizing the compiler for its own particular environment.

{% credits %}{% endcredits %}
