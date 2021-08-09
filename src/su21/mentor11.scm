#| CS 61A Tutorial 11 Summer 2021 |#


;;;;;;;;;;;;;;;;;;
; TAIL RECURSION ;
;;;;;;;;;;;;;;;;;;

#|
4. Rewrite count-instance to be tail recursive. (Hint: helper functions are often useful in
implementing Tail Recursion.)
|#
(define (count-tail lst x)

)

#|
5. Implement filter, which takes in a one-argument function f and a list lst, and
returns a new list containing only the elements in lst for which f returns true. Your
function must be tail recursive.
You may wish to use the built-in append function, which takes in two lists and returns
a new list containing the elements of the first list followed by the elements of the
second.
|#
(define (filter f lst)

)

;;;;;;;;;;
; SCHEME ;
;;;;;;;;;;

#|
1. Suppose Isabelle bought turnips from the Stalk Market and has stored them in ran-
dom amounts among an ordered sequence of boxes. By the magic of time travel,
Isabelle’s friend Tom Nook can fast-forward one week into the future and determine
exactly how many of Isabelle’s turnips will rot over the week and have to be dis-
carded.
Assuming that boxes of turnips will rot in order, i.e. all of box 1’s turnips will rot
before any of box 2’s turnips, help Isabelle determine which turnips will still be fresh
by week’s end. Specifically, fill in decay, which takes in a list of positive integers
boxes, which represents how many turnips are in each box, and a positive integer
rotten representing the number of turnips that will rot, and returns a list of non-
negative integers that represents how many fresh turnips will remain in each box.
|#
(define (decay boxes rotten)

)

#|
2. (a) Define append, which takes in two lists and returns a new list with all the ele-
ments of the first list followed by all the elements of the second. Do not use the
built-in append function.
|#
(define (append lst1 lst2)

)

#|
2. (b) Define reverse. Hint: use append.
|#
(define (reverse lst)

)

#|
2. (c) Define reverse tail-recursively. Hint: use a helper function and cons.
|#
(define (reverse lst)

)

;;;;;;;;;;;;;;;;;;;;
; SCHEME CHALLENGE ;
;;;;;;;;;;;;;;;;;;;;

#|
1. Finish the functions max and max-depth. max takes in two numbers and returns the
larger. Function max-depth takes in a list lst and returns the maximum depth of
the list. In a nested scheme list, we define the depth as the number of scheme lists a
sublist is nested within. A scheme list with no nested lists has a max-depth of 0.
|#
(define (max x y) _____________________________________)
(define (max-depth lst)
    (define (helper lst curr)
        (cond
            ((__________) ________________________)
            ((__________) (max ______________________________________________________________))
            (else (helper ________________________))
        )
    )
    (____________________________)
)

#########
# REGEX #
#########
"""
1. We are given a linear equation of the form mx + b, and we want to extract the m and
b values. Remember that ’.’ and ’+’ are special meta-characters in Regex.
This problem is written by Kunal Agarwal
"""
import re
def linear_functions(eq_str):
    """
    Given the equation in the form of 'mx + b', returns a
    tuple of m and b values.
    >>> linear_functions("1x+0")
    [('1', '0')]
    >>> linear_functions("100y+44")
    [('100', '44')]
    >>> linear_functions("99.9z+23")
    [('99.9', '23')]
    >>> linear_functions("55t+0.4")
    [('55', '0.4')]
    """
    return re.findall(r"__________", eq_str)