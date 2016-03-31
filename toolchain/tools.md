# The LilyPond “Toolchain”

As we said working with “LilyPond” actually implies working with a set of tools
that cover the components of a “LilyPond Toolchain”, going from a textual input
file through LilyPond itself into a (graphical) output file:

<div style="text-align:center;padding-bottom:1em">
<img src="/assets/images/lilypond-flow-small.png" />
</div>

This approach provides more freedom and flexibility than having everything in a
single application.  You can choose between different tools or versions -
individually for the different stages.  Moreover, you can even use completely
different *types* of tools to work with, from the most basic text editors to
full-fledged desktop applications.  Don't worry if this may seem somewhat
abstract for now, we are sure that you are going to appreciate the beauty and
power that lies in having that option.

#### Editor

The editor is your main “interface” to the system so its choice is the main
consideration.  As can be seen in the above figure there are several options,
and for each type there exists a number of actual programs.  The following pages
explain the differences in some detail.

#### Compiler

Well, the “compiler” part seems to be pretty clear, this will of course be
LilyPond itself.  However, there is the choice between the “stable” and the
“development” version, and this is not as obvious as it may seem.

#### Viewer

The “viewer” part is also pretty clear.  LilyPond can produce a number of output
formats and you can use whatever viewer is available for them on your
system.  However, there are some subtleties here that deserve further
consideration.

---

Most (first-time) users will have the three parts united in a single desktop
application, a so-called *Integrated Development Environment* or
[IDE](ides.html).  But one should nevertheless have a clear idea about the
underlying concepts so on the following pages we'll introduce them first.

{% credits %}{% endcredits %}
