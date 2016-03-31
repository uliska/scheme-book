# Output Formats and Viewers

We have seen that LilyPond “compiles” input files but we haven't discussed yet
what the possible targets are and what to do with the resulting file.

The default use case is to create graphical scores in PDF format, but LilyPond
can also produce a number of other graphical formats: PNG pixel graphics,
PostScript code and SVG vector graphics.  Additionally LilyPond can produce
MIDI files with the pure musical content of the score[^1].

For each of these formats your operating system will have free and commercial
viewers available so we won't bother mentioning examples. Usually you can simply
open the generated file with your operating system's method (e.g.
double-clicking on it) and have the appropriate tool launch automatically.  But
there are a few special aspects worth mentioning.


### Point-and-click

In PDF and SVG files LilyPond can provide “Point-and-click” links that reference
the originating text position for any graphical object in the file.  This can be
used to toggle between the input and the resulting score, making it easy to
navigate even in complex documents.  While being a standard feature in IDEs
arbitrary viewers and editors can be talked into providing this service with
some extra work.

### Cropping the Output

An interesting feature that simplifies the integration of LilyPond scores and
snippets in other documents (text, DTP) is the ability to crop the output.  It
is easily possible to crop the output to a rectangle with the actual content,
and it is possible to produce individual cropped files for each system in a
score.  These can be used in word processors or layout programs to have
multi-staff scores “flow” through pages.

### File Lock (Adobe Reader)

When working with a compiling system like LilyPond one regularly recompiles the
document to see the latest changes.  Upon each compilation the resulting file is
overwritten, which your system's viewer may prevent if it locks opened files
(most notably this is Adobe Reader on Windows).  It is strongly recommended to
use a PDF viewer that automatically reloads a modified file instead.

---

[^1]:
It is worth mentioning that with some (programming) work LilyPond can be made to
produce arbitrary data as well.  While this *may* be something for you on the
long run it is much more likely that you will come across this option through
the use of *libraries*.  For example
[ScholarLY](https://github.com/openlilylib/openlilylib/tree/master/ly/scholarly)
can produce lists of annotations in a number of file formats, including plain
text, LaTeX and (planned) PDF or HTML.

{% credits %}{% endcredits %}
