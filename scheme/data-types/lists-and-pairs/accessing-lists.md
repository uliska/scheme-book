# Accessing Lists

Accessing lists and retrieving their elements is really similar to handling
pairs - which seems quite natural as lists are built from pairs.

#### car/cdr Access

In the previous chapter we have already seen how the `car` and the `cdr` of
lists can be retrieved, and the `cadr` and friends shorthands are available for
lists as well:

```
guile> (define l (list 1 2 3 4))
guile> l
(1 2 3 4)
guile> (car l)
1
guile> (cdr l)
(2 3 4)
guile> (cadr l)
2
guile> (cddr l)
(3 4)
guile> (caddr l)
3
guile> (cdddr l)
(4)
guile> (cadddr l)
4
```

Adding `d`s in the `cXXr` procedure name selects increasingly “right” parts of
the list, while using an `a` as the initial letter selects the corresponding
*value* at that position.

One point of specific interest is the *last* element. As explained in the
previous chapter *any* `cdr` variant retrieves a *list* (at least from a
*proper* list), so `(cdddr l)` also returns `(4)`.  In order to retrieve
*values* from a list on always has to use the `a` as the first letter,
equivalent to using “the car of whatever position in the list we are interested
in”.

As a mental exercise think about what the `cdar` of this list would be and why
`(cddddr l)` returns what it returns (if you have read the previous chapter the
second question should be clear).


#### first/second Access

**TODO:** Check where these are really defined

Guile defines a number of convenience accessor methods to retrieve list elements
by their position specified in English words:

```
guile> (first l)
1
guile> (second l)
2
```

Such procedures are defined for the first ten elements of a list (i.e. `first`
through `tenth`). In addition there is the `last` procedure that always
retrieves the `car` of the last list element. This means it is not necessary
anymore to explicitly unfold the value using `car`.  But it *may* produce
unexpected results when the list is an improper list:

```
guile> (last '(1 2 3 4 . 5))
4
```

#### Other Access Options
