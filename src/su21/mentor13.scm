#| CS 61A Tutorial 13 Summer 2021 |#

;;;;;;;;;;
; SCHEME ;
;;;;;;;;;;
#|
1. You are creating a computer from scratch. In their rawest form, computers use
0s and 1s to compose commands and data. Fill in a function that takes a list of
boolean values representing an unsigned binary number and returns its decimal
representation. Each #t in the list represents a 1 and each #f represents a 0, with
the first element in the list being the rightmost (smallest) binary digit and the last
element being the leftmost (largest) binary digit.
|#
(define (binary bin-list)
  (cond
    ((null? ____________)
      __________________
    )
    ((__________________)
      __________________________________
    )
    (else
      __________________________________
    )
  )
)

#|
2. Now, write the binary to decimal function, but in tail recursive form. Note that the
expt function takes in a base and an exponent. For example, (expt 2 3) raises 2
to the third power, returning 8.
|#
(define (binary-tail bin-list)
    (define (helper bin-list i sum)
        (cond
            ((null? ____________) __________________)
            ((__________________) ______________________________________________)
            (else ______________________________________________)
        )
    )
    (helper ________________)
)

#|
3. Given the function run, write the helper function duplicate that takes in a list of
integers, lst, and an integer n. The duplicate function takes each element of the
list and duplicates it by its value (i.e. If the first number in the list is 2, add 2 as the
next element in the list so we have a total of two 2’s in the list).
|#
(define run
	(lambda (lst)
		(duplicate lst 0)
	)
)  

(define duplicate






)

;;;;;;;;;;;;;;;;;;
; TAIL RECURSION ;
;;;;;;;;;;;;;;;;;;
#|
1. Implement slice, which takes in a a list lst, a starting index i, and an ending index
j, and returns a new list containing the elements of lst from index i to j - 1.
|#
(define (slice lst i j)
    






)

#|
2. Now implement slice with the same specifications, but make you implementation tail
recurisve.
You may wish to use the built-in append function, which takes in two lists and returns
a new list containing the elements of the two lists concatenated together.
|#
(define (slice lst i j)





)