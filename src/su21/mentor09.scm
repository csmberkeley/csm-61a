#| CS 61A Tutorial 9 Summer 2021 |#


;;;;;;;;;;;;;;;;;;;
; INTRO TO SCHEME ;
;;;;;;;;;;;;;;;;;;;

#|
2. Define a program called hailstone, which takes in two numbers seed and n, and
returns the nth hailstone number in the sequence starting at seed. Assume the hailstone sequence
starting at seed is longer or equal to n. As a reminder, to get the next number in the
sequence, if the number is even, divide by two. Else, multiply by 3 and add 1.
|#
(define (hailstone seed n)



)

;;;;;;;;;;;;;;;;
; SCHEME LISTS ;
;;;;;;;;;;;;;;;;

#|
4. Define a function reverse-map, which takes in a list of functions, operators, and a
single argument, arg, and returns a list that results from applying all of the functions
in operators on arg. You may assume that all functions in operators will work
properly with the single input arg.
|#
(define (reverse-map operators args)
    (if (______________________________)
        ________________________________________________________________________)
)

#|
5. Define is-prefix, which takes in a list p and a list lst and determines if p is a
prefix of lst. That is, it determines if lst starts with all the elements in p.
|#
(define (is-prefix p lst)


)

#|
6. Implement waldo. waldo returns #t if the symbol waldo is in a list.
|#
(define (waldo lst)



)

#|
7. Extra challenge: Define waldo so that it returns the index of the list where the symbol
waldo was found (if waldo is not in the list, return #f).
|#
(define (waldo lst)


)