# The `lambda` Expression

As said in the previous introduction `lambda` is an expression that creates - or
*evaluates to* - a procedure.  It has the general form

```
(lambda <formals> <expressions>)
```

`<formals>` is where the *arguments* are specified that the procedure will be
applied to, and `expressions` is an arbitrary number of expressions that is
evaluated in sequence.  As usual the value of the last expression will become
the value of the procedure as a whole.  But let's consider this with an example:

### Creating a procedure

```
guile> (lambda (x) (+ x x))
#<procedure #f (x)>
```

We can see from the printed result that our expression *is* a procedure, but it
may not be as obvious how that expression works. We can investigate this by
reformatting the expression:

```
(lambda
  (x)
  (+ x x)
)
```

The first argument to `lambda` is `(x)`.  This tells the parser that the
procedure will accept exactly one argument, and this argument will be visible by
the name of `x` in the body of the procedure.

The body of the procedure consists of the single expression `(+ x x)` which
simply takes the argument `x` and adds it to itself.  The result of this
“duplication” will become the value of the whole procedure.

#### Parameter types

Here we can see something in action that has been mentioned much earlier in the
introduction to [data types](../index.html): Scheme does *not* impose any
restriction on the data type that is passed to the procedure, in fact a value of
arbitrary type may be locally *bound* to the name `x`.  But as we use `x` in the
expression `(+ x x)` it is clear that only types can be accepted which the `+`
operation can be applied to.  Scheme doesn't “guard” procedures against
unsuitable parameters through type-checking, which has its pros and cons.  The
problem can be that possible errors occur within the procedure and not at its
interface, which can make them harder to pinpoint.  On the other hand this opens
a lot of potential for “polymorphism”, that is the possibility to write a single
interface that behaves differently depending on the type of arguments that are
passed into it.

### *Using* the Procedure

Now we have created a procedure, but it doesn't *do* anything yet, so how can we
make use of it? Correct, by *applying* it. Our expression *is* a procedure
expecting one argument, so we can use it like one: `(procedure arg1)`. Usually
when applying a procedure we refer to it by its *name*, but that name doesn't do
anything else than *evaluating to* the procedure itself, so for Scheme it
doesn't make a difference if we use the name or its definition:

```
guile>
(
 (lambda (x) (+ x x))
 12
)
24
```

We have an enclosing pair of parens to denote the *procedure application*, then
the definition of the procedure in the first position, followed by a number as
the single argument.  The expression correctly evaluates to 24, which
corresponds to 12 + 12.

Of course it rarely makes sense to create a procedure just for a single
application, but for now we'll stick to that approach and dedicate a full
chapter to the different ways of binding and reusing procedures.

### Multiple Paramters and Expressions

Our first procedure accepted a single argument, and its body also consisted of a
single expression.  But of course multiple arguments and epxressions can be
handled:

```
guile>
(lambda (x y)
  (display (format "X: ~a\n" x))
  (display (format "Y: ~a\n" y))
  (+ x y))
#<procedure #f (x y)>
```

This procedure will accept two parameters, which will be visible by the names
`x` and `y` in the procedure body.  This time the body evaluates three
expressions in sequence: the first two expressions print the input arguments to
the console while the third and last one evaluates the sum of the parameters and
returns that as the whole procedure's value.

We can apply this procedure the same way as the previous one, although it starts
to get awkward doing that in the Scheme REPL that doesn't forgive any typing
errors:

```
guile>
((lambda (x y)
    (display (format "X: ~a\n" x))
    (display (format "Y: ~a\n" y))
    (+ x y))
  9
  12)
X: 9
Y: 12
21
```

In the last three lines we can see the printout from the `display` procedure and
finally the *value* of the expression.  *(You may make a mental note of the
characteristic double paren at the opening of this expression.)*

### Exercise: Handle Different Parameter Data types

As an exercise we will rewrite the second example so that it can handle the
input arguments as either numbers or strings.  As this might become an exercise
with some iterations we will implement it in a LilyPond file instead of the
Scheme REPL.  The first iteration is basically a “LilyPondified” version of the
previous example, wrapping the whole expression in a `display` but leaving the
two  redundant expressions in the procedure body that correctly prints `21` to
the console:

{% lilypond %}
#(display
  ((lambda (x y)
     (+ x y))
   9 12))
{% endlilypond %}

#### First Case: Both Arguments must have the same case

Now we want to support the possibility of alternatively passing the arguments in
the form `"9" "12"` as strings, which doesn't work with the current function as `+`
can only be used with numbers.  This is a primary use case for a conditional
expression, and in this case we should use `cond` because we have more than two
possible cases:

```
(cond
  (both numbers: simply add them)
  (both strings: convert them to numbers,
   add them,
   convert the result back to a string)
  (else: report an error)
)
```

We'll start by integrating the conditional expression in our procedure but leave
out the strings part in the first step.  As we want *both* arguments to be of
the same type we will use nested `and` expressions in each clause's test:

{% lilypond %}
#(display
  ((lambda (x y)
     (cond
      ((and (number? x) (number? y))
       (+ x y))
      ((and (string? x) (string? y))
       "calculation not implemented yet")
      (else
       "Type error with the arguments")))
   "9" "12"))
{% endlilypond %}

The first clause of the `cond` is evaluated if both arguments are numbers while
the second is used when both arguments are strings - which is the case in this
example, therefore the corresponding message is printed to the console.

To convert numbers to and from  strings Scheme has the procedures
`number->string` and `string->number` which we'll both use for the
implementation of the second clause. In other languages we might be tempted to
do that operation in three consecutive expressions, but in Scheme we will create
one single expression which will be evaluated inside out:

```
(
  number->string
    (+
      (string->number x)
      (string->number y)
    )
)
```

First (inside) the two arguments are converted to numbers, then they are passed
to `+`, and finally the value of the `+` expression is converted back to a
string. Integrated into the complete procedure this looks like this:

{% lilypond %}
#(display
  ((lambda (x y)
     (cond
      ((and (number? x) (number? y))
       (+ x y))
      ((and (string? x) (string? y))
       (number->string
        (+
         (string->number x)
         (string->number y))))
      (else
       "Type error with the arguments")))
   "9" "12"))
{% endlilypond %}

which now correclty prints `21`

This procedure already looks pretty daunting, isn't it?  But if you have
followed me to this point you should by now realize that such constructs are
really built from smaller and smallest building blocks.  If you are careful
about the nesting of expressions and do that by dissecting the intention of your
procedure it should really be possible to determine how many parens are needed
and where they have to be placed.

There is one thing I have left out in this example: checking if the strings
actually represent numbers. If you pass `"9" "foo"` the procedure will fail. You
may want taking that challenge as an exercise on your own.  As a hint I can tell
you that `string->number` returns `#f` in case of failure.


#### Second Case: Treat Parameters Independently

In the first example both parameters had to have the same type, being either
both numbers of both strings.  However, as a second exercise we'll make this
more general by saying that each parameter can be a number or a string
independently.  The return will always be a number.

There are (at least) two different approaches to the task, but I deliberately
choose the one where we can practice local bindings with `let`.  This time we
don't need to check whether *both* arguments are of the same type but instead
want to ensure there is a number available for the addition.  To achieve that we
will create local bindings and convert the parameters if necessary.

For each of the parameters we determine whether it is a string and convert that
to a number, otherwise we directly bind the parameter to the local name. Remember
that an `and` expression's value is that of the last subexpression, in our case
the converted number.

```
(let
  ((x-num
    (or
        (and (string? x)
        (string->number x))
    x))
...
```

{% lilypond %}
#(display
  ((lambda (x y)
     (let
      ((x-num
        (or
         (and (string? x)
              (string->number x))
         x))
       (y-num
        (or
         (and (string? y)
              (string->number y))
         y)))
      (+ x-num y-num)))
   9 "12"))
{% endlilypond %}
