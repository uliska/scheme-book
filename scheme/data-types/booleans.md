# Booleans

*Boolean expressions* are expressions that represent a “true” or ”false” value.
This sounds trivial, but in fact, although *any* programming language relies on
having some boolean representation , there are significant differences in how
they are actually handled.

Scheme's explicit constants for true and false are `#t` and `#f`.  It has to be
stressed in particular that there is that overlap with the hash sign as the
indicator for LilyPond's parser.  Concretely that means that when entering
boolean values *in LilyPond* you need to write *two* hashes, which often causes
confusion:

{% lilypond %}
\paper {
  ragged-bottom = ##t
  ragged-last-bottom = ##f
}
{% endlilypond %}

We have already encountered these true or false values in predicates, which are
procedures that evaluate to `#t` or `#f`.  However, booleans are not only used
explicitly but more often implicitly. If an arbitrary expression “evaluates to a
true value” this value isn't necessarily `#t`. We will discuss this topic in
depth in the chapter about [conditionals](../conditionals.html).
