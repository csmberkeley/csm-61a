# BEGIN GROUP Fa15 MT2 - D-K Complete Trees [6]
Implement `complete`, which takes a `Tree` instance `t` and two positive integers `d` and `k`. It returns
whether `t` is `d-k`-complete. A tree is `d-k`-complete if every node at a depth less than `d` has exactly `k` branches
and every node at depth `d` is a leaf.

Notes: The depth of a node is the number of steps from the root; the
root node has depth 0. The built-in all function takes a sequence and returns whether all elements are true:
values: all([1, 2]) is True but all([0, 1]) is False.

```
def complete(t, d, k):
    """ Return whether t is d-k- complete .
    >>> complete ( Tree (1), 0 , 5)
    True
    >>> u = Tree (1, [ Tree (1), Tree (1), Tree (1)])
    >>> [ complete (u, 1 , 3) , complete (u, 1 , 2) , complete (u, 2 , 3) ]
    [True , False , False ]
    >>> complete ( Tree (1, [u, u, u]), 2 , 3)
    True
    """
    if _____________(a)_________________:
    return _________________________(b)___________________________________
    bs = [__________________________(c)_______________________________________]
    return _______________________(d)________________________________ and all(bs)
```

# BEGIN QUESTION [2]

What goes in blank (a)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
t.is_leaf()
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (b)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
d == 0
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (c)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
complete (b , d -1 , k ) for b in t.branches
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (d)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
len ( t . branches ) == k
# END SOLUTION

# END QUESTION

# END GROUP

# BEGIN GROUP Flattener [5]

Write a generator function `flattener` that yields flattened elements in a possibly deeply-nested list.
```
def flattener(lst):
    """
    >>> list(flattener([1,2,3,4,5]))
    [1,2,3,4,5]
    >>> list(flattener([1,2,3,[4,5],6]))
    [1,2,3,4,5,6]
    >>> list(flattener([1,2,[3,4,[5,6,7]],8]))
    [1,2,3,4,5,6,7,8]
    """
    for i in range(len(lst)):
        elem = lst[i]
        if _________(a)_________:
            ________(b)_____________
        else:
            ________(c)_________
```
# BEGIN QUESTION [2]
What goes in blank (a)?
# INPUT SHORT_CODE_ANSWER
# BEGIN SOLUTION
isinstance(elem, lst)
# END SOLUTION
# END QUESTION
# BEGIN QUESTION [2]
What goes in blank (b)?
# INPUT SHORT_CODE_ANSWER
# BEGIN SOLUTION
yield from flattener(elem)
# END SOLUTION
# END QUESTION

# BEGIN QUESTION [2]
What goes in blank (c)?
# INPUT SHORT_CODE_ANSWER
# BEGIN SOLUTION
yield elem
# END SOLUTION
# END QUESTION
# END GROUP


# BEGIN GROUP Sp18 MT2 - Expand [6]
(Mutable Lists and Complexity)
Implement `expand`, which takes a grid `g`, a number of rows `h`, and a `fill` value. It mutates the contents of `g` so that `g` has t least `h` rows and `w` columns. Any added values are `fill`.

```
def expand(g, h, w, fill):
    """Expand grid g so that it has at least h rows and w columns.

    >>> g = [[1, 2, 3], [40, 50, 60]]

    >>> print_grid(expand(g, 2, 5, 10))
    1 2 3 10 10
    40 50 60 10 10

    >>> print_grid(expand(g, 5, 6, 0))
    1 2 3 10 10 0
    40 50 60 10 10 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0

    >>> print_grid(expand(g, 0, 0, 5)) # expand never reduces the dimensions of g.
    1 2 3 10 10 0
    40 50 60 10 10 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    0 0 0 0 0 0
    """
    for row in g:
        row._(a)_(_(b)_)
    for k in _(c)_:
        g._(d)_(_(e)_)
    return g
```
# BEGIN QUESTION
What goes in blank (a)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
row.extend([fill] * (w - len(row)))
Alternate correct answer: row.extend([fill] * max(0, (w - len(row))))
# END SOLUTION

# END QUESTION


# BEGIN QUESTION
What goes in blank (b)?
# INPUT SHORT_CODE_ANSWER

# END QUESTION

# BEGIN QUESTION
What goes in blank (c)?
# INPUT SHORT_CODE_ANSWER
# BEGIN SOLUTION
range(h - len(g))
# END SOLUTION
# END QUESTION



# BEGIN QUESTION
What goes in blank (d)?
# INPUT SHORT_CODE_ANSWER
# BEGIN SOLUTION
g.append([fill] * w)
Alternate correct answer: range(max(0, h - len(g)))
# END SOLUTION
# END QUESTION

# BEGIN QUESTION
What goes in blank (e)?
# INPUT SHORT_CODE_ANSWER

# END QUESTION

# BEGIN QUESTION [2]

Fill the `Θ` expression that describes how many new values must be added when a grid with `n` rows
and `n` columns is expanded to `2×n` rows and `2×n` columns using the `expand` function. Assume that `expand` is implemented correctly.

# INPUT OPTION $\theta(1)$

# INPUT OPTION $\theta(\log (n))$

# INPUT OPTION $\theta(n)$

# INPUT OPTION $\theta(n^2)$

# INPUT OPTION $\theta(2^n)$

# BEGIN SOLUTION
$\theta(n^2)$
# END SOLUTION

# END QUESTION

# END GROUP

# BEGIN GROUP Criss-cross [10]

Create a function `criss-cross` with takes in two scheme lists and builds a new list by alternating between them. You should switch lists whenever `p1` and `p2` have the same element. Criss-crossing the two lists `(1 2 3 4 5)` and `(5 4 3 2 1)` should yield `(1 2 3 2 1)`, since we switch to `p2` at `3`.

```
(define (criss-cross p1 p2)
  (cond
     ((___(a)___ p1) p2)
     ((___(b)___) p1)
     ((eq? ___(c)___ (car p2))
        (cons (car p1) ___(d)___))
     (else ___(e)___)
  )
)
```

# BEGIN QUESTION [2]

What goes in blank (a)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
null?
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (b)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
null? p2
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (c)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
(car p1)
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (d)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
(criss-cross (cdr p2) (cdr p1))
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [2]

What goes in blank (e)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
(cons (car p1) (criss-cross (cdr p1) (cdr p2)))
# END SOLUTION

# END QUESTION

# END GROUP

# BEGIN GROUP Fa19 Final - Macro Lens [3]

Implement `partial`, a macro that takes a `call` expression that is missing its last operand. A call to `partial` evaluates to a one-argument procedure that takes a value `y` and returns the result of evaluating `call` extended to include an additional operand `y` at the end.

```
;; A macro that creates a procedure from a partial call expression missing the last operand.
;; (define add-two (partial (+ 1 1))) -> (lambda (y) (+ 1 1 y))
;; (add-two 3) -> 5 by evaluating (+ 1 1 3)
;;
;; (define eq-5 (partial (equal? (+ 2 3)))) -> (lambda (y) (equal? (+ 2 3) y))
;; (eq-5 (+ 3 2)) -> #t by evaluating (equal? (+ 2 3) 5)
;;
;; ((partial (append '(1 2))) '(3 4)) -> (1 2 3 4)
(define-macro (partial call)
    `(lambda (y) ,(___(a)___ ___(b)___ (list `___(c)___))))
```

# BEGIN QUESTION [1]

What goes in blank (a)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
append
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [1]

What goes in blank (b)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
call
# END SOLUTION

# END QUESTION

# BEGIN QUESTION [1]

What goes in blank (c)?
# INPUT SHORT_CODE_ANSWER

# BEGIN SOLUTION
y
# END SOLUTION

# END QUESTION

# END GROUP
