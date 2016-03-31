# Custom Data Types

Scheme is a very “generic” programming language that is extremely extensible.
In fact it is often used to write programming languages itself.  This
extensibility includes data types as well.  While the fundamental types are
built into the language there is no restriction to defining new predicates to
check whether a given value matches some criteria.  For example it may make
sense to check whether an argument is one out of a fixed list of symbols, or if
a number is within a given range.

When you encounter a predicate (a procedure whose name ends with a question
mark) in existing code this predicate/type can stem from a number of origins:

* Scheme itself
* Guile's Scheme implementation
* LilyPond
* Custom code

This can be pretty confusing as there is no way to discern these origins from
within the code.  If it doesn't seem possible to determine it is actually the
best choice not to hesitate and ask on the `lilypond-user` mailing list.

We will discuss how to create custom data types in a [later
chapter](../procedures/predicates.html).  For now we will look into one custom
data type that is defined by LilyPond: `color?`.

#### Dissecting the color? data type

**TODO:** find the online link to notation/inside-the-staff.html#index-color-1
and learning/visibility-and-color-of-objects.html#the-color-property

To color noteheads red we are directed to use:

{% lilypond %}
\override NoteHead.color = #red
{% endlilypond %}

We use the hash sign so `red` is a Scheme expression.  However it is neither
enclosed in parentheses nor prepended with an apostrophe, so it obviously is a
variable.  In the Scheme shell we can investigate this expression, first we
check if it is of type `color`:

```
guile>(color? red)
#t
```

Not surprisingly it *is* a color object. But let's now see what it is
internally:

```
guile>red
(1.0 0.0 0.0)
```

So obviously a `color?` is a list of three values. The actual values for `red`
indicate that the three values are the RGB colors, measured in values between
`0` and `1`.  You can verify this by playing around with other colors, e.g.
`blue`, `yellow`, `grey` etc.

The manual suggest another way of specifying colors from the list of X11 colors:

{% lilypond %}
\override NoteHead.color = #(x11-color 'LimeGreen)
{% endlilypond %}

Let's check this as well in the shell:

```
guile> (x11-color 'LimeGreen)
(0.196078431372549 0.803921568627451 0.196078431372549)
```

This time we call a procedure `x11-color` with the symbol `'LimeGreen`, and
again it returns a list of three floating point numbers.

Obviously a color variable *is* a list.  So in order to get a deeper
understanding we'll check if it works the other way round as well, by passing a
list to the LilyPond override:

{% lilypond %}
{
  \override NoteHead.color = #'(0.7 0.3 0.8)
  c''4 c''
}
{% endlilypond %}

Not surprisingly this works as well and colors the noteheads in a nice violet.
So in this chapter you have learned that it is possible to build custom data
types from the fundamentals and check arguments against them at runtime.  Guile
makes use of that feature to extend Scheme's functionality, and LilyPond does so
as well, so in real-world code you may encounter a large number of different
data types.

{% credits %}{% endcredits %}
