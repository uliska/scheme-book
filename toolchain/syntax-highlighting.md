# Syntax Highlighting

Similar to natural languages (but much more strictly defined) computer languages
have a grammar, syntax and vocabulary.  In a very simplified way this means that
there are certain types of items: known words (*keywords*), variables, literal
values, operators, comments, grouping indicators etc., and these may only be
combined in predefined ways.

*Syntax highlighting* is a common editor feature to apply styles like colors and
font modifications like bold and italic typefaces.  This makes an input
language more easily readable for the *human* editor - while the compiling
machine doesn't care about it at all.

{% image width="60%",
   caption="Johannes Brahms: Violin sonata G major op. 78" %}
   /assets/toolchain/brahms-syntax-highlighting.preview.svg
{% endimage %}.

Let's have a look at the *source code* or *input file* used to produce this
Brahms snippet as it would look in a basic text editor wihout syntax
highlighting.  With its uniformity it is rather hard to tell the different items
apart although everything should actually be self-explanatory:

```
\relative d''
{
  \key g \major
  \time 6/4
  % Some musicians prefer metronome indications
  \tempo "Vivace ma non troppo"
  r2. r4 d-.(
    -\markup { \dynamic "p" \italic "mezza voce" }
    r8 d-.) | d4.( c8 b g) d2.
}
```

Reading the same snippet of LilyPond code *with* syntax highlighting applied
makes the relations much clearer.  It may still look somewhat overwhelming for a
new user but the color coding and typographic conventions will make it
significantly easier to learn “writing” music this way.

{% lilypond %}
\relative d''
{
  \key g \major
  \time 6/4
  % Some musicians prefer metronome indications
  \tempo "Vivace ma non troppo"
  r2. r4 d-.(
    -\markup { \dynamic "p" \italic "mezza voce" }
    r8 d-.) | d4.( c8 b g) d2.
}
{% endlilypond %}

{% credits %}{% endcredits %}
