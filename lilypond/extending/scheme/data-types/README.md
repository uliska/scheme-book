# Data Types

In programming languages each value has a *type*.  This is not different in
Scheme, and we have already seen some data types in the previous chapters.  As
this is not a formal introduction to programming in Scheme we won't cover this
topic systematically but will instead try to deal with those issues that seem to
be specifically hard to get into for the average LilyPond user.  Specific weight
will be given to lists and everything that is related.

#### Predicates

Before starting to discuss simple data types let us have a look at *predicates*.
Predicates are procedures that check if a given object has a given type.  They
return `#t` (Scheme's value for “true”) if the test is successful and `#f`
(“false”) otherwise.  Predicates are often used to either check if an argument
is valid, or to execute the right code based on its type.

By convention the name of a predicate has a trailing question mark, so for
example `number?` checks if a given value is a number etc.

```
guile>(string? "I'm a string")
#t

guile>(integer? 4.2)
#f

guile>(list? (list 1 2 3))
#t

guile>(pair? (list 1 2 3))
#t
```

Well, the last example looks confusing, but we will go into some depth with
these in the respective chapter about list and pairs.

**TODO:** Check references to lists of predicates (Scheme/Guile/LilyPond)

{% credits %}{% endcredits %}
