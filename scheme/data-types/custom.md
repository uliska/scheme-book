# Custom Data Types

Now that we've discussed some of the basic data types it is important to
understand that Scheme can be substantially extended with arbitrary “data
types”.  The basic step to defining a data type in Scheme is writing a predicate
to check if a given object satisfies the requirements for that data type.

Data types are defined in the following layers, and it may be complicated to
trace sometimes:

* Scheme itself
* Guile's Scheme implementation
* LilyPond
* Custom (user/library) code

You may now want to have a look at the **TODO:** list of predicates in
LilyPond's documentation.

The creation of custom data types is discussed in a [later
chapter](../procedures/predicates.html), but for now we will investigate one
custom data type that is defined by LilyPond: `color?`.

#### Dissecting a Custom Data Type

**TODO:** find the online link to notation/inside-the-staff.html#index-color-1
and learning/visibility-and-color-of-objects.html#the-color-property

To apply a color to score elements one overrides it's `color` property:

{% lilypond %}
\override NoteHead.color = #red
{% endlilypond %}

The hash sign switches to Scheme, and `red` is given as a variable name.  Using
the Scheme REPL we can investigate what this evaluates to:

```
guile>red
(1.0 0.0 0.0)
```

Obviously `red` is a list of three floating-point numbers.  If you know
something about colors you may now guess that the three numbers represent the
RGB values, presumably within a range of `0` and `1`.  We stop this by telling
you that this it correct, but you may wish to experiment by inspecting other
colors, e.g. `blue`, `green`, `yellow` or `magenta`.

The predicate `color?` is responsible for verifying if a value is a color, so we
can try a few things to get closer to the definition of `color?`:

```
guile>(color? red)
#t

guile> (color? '(1 0 1))
#t

guile> (color? '(1 0 0.5))
#t

guile> (color? '(2/3 1 0.2))
#t

guile> (color? '(3/2 1 1))
#f

guile> (color? '(0 1 0 1))
#f
```

Obviously a color is a color when it consists of three real numbers in the range
of `0 =< n =< 1`.  The numbers can be written as integers, fractions or reals,
as long as they are within the proper range.  There have to be exactly three
such numbers.

---

The manual suggest another way of specifying colors from the list of X11 colors:

{% lilypond %}
\override NoteHead.color = #(x11-color 'LimeGreen)
{% endlilypond %}

Let's check this as well in the shell:

```
guile> (x11-color 'LimeGreen)
(0.196078431372549 0.803921568627451 0.196078431372549)

guile> (color? (x11-color 'LimeGreen))
#t
```

This time we call a procedure `x11-color` with the symbol `'LimeGreen`, and
again it returns a list of three floating point numbers, which “is” a color.

---

Now that we know what a color *is* we can try out to use custom colors created
ad-hoc:

{% lilypond %}
{
  \override NoteHead.color = #'(0.7 0.3 0.8)
  c''4 c''
}

{
  \override NoteHead.color = #'(3/2 0.3 1)
  c''4 c''
}

{% endlilypond %}

Not surprisingly only the first example works as well and colors the noteheads
in a nice violet.  The second object violates the requirements of `color?` as
the first number is greater than 1.  As a result LilyPond prints a warning to
the console and ignores the override: `warning: type check for 'color' failed;
value '(3/2 0.3 1)' must be of type 'color'`.

Obviously it it possible to use anything as a color property that evaluates to
something satisfying the `color?` predicate, whether it is a predefined color
variable, an ad-hoc list or a call to a custom procedure.  At the same time the
type check (which is actively performed by LilyPond) acts as a safety net: it
prints a warning and tries to continue the compilation, and so it prevents the
program to crash upon erroneous user input.

---

So in this chapter you have learned about the characteristics of data types and
predicates.  They allow to specify how data has to be formed in order to be
successfully processable by the program.  Guile makes use of that feature to
extend Scheme's functionality, and LilyPond does so as well, so in real-world
code you may encounter a large number of different data types.
