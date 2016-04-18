# Defining Predicates

In the discussion of [custom data types](data-types/custom.html) we discussed the `color?` predicate. Here is its definition:

{% lilypond %}
(define-public (color? x)
  (and (list? x)
       (= 3 (length x))
       (every number? x)
       (every (lambda (y) (<= 0 y 1)) x)))
{% endlilypond %}
