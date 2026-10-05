(define (sum-list lst)
  (if (null? lst)
    0
    (+ (car lst) (sum-list (cdr lst)))
  )
)
(define (sum-list-tail lst)











)


;Doctests
scm> (filter-lst (lambda (x) (> x 2)) '(1 2 3 4 5))
(3 4 5)

(define (filter-lst f lst)










)


;Doctests
scm> (slice '(0 1 2 3 4) 1 3)
(1 2)
scm> (slice '(0 1 2 3 4) 3 5)
(3 4)
scm> (slice '(0 1 2 3 4) 3 1)
()

(define (slice lst i j)
    






)
(define (slice lst i j)
    










)




(if 1 (+ 2 3) (/ 1 0))
(or #f (and (+ 1 2) 'apple) (- 5 2))
(define (square x) (* x x))

(+ (square 3) (- 3 2))
(define (add x y) (+ x y))

(add (- 5 3) (or 0 2))


scm> (define pi 3.14)
pi
scm> (define (hack x)
	  (cond
	    ((= x pi) 'pwned)
	    ((< x 0) (hack pi))
	    (else (hack (- x 1)))))
hack
scm> (hack 3.14)
pwned
scm> ((lambda (x) (hack x)) 0)
pwned


;doctests
scm> (max 1 5)
5
scm> (max-depth '(1 2 3))
0
scm> (max-depth '(1 2 (3 (4) 5)))
2
scm> (max-depth '(0 (1 (2 (3 (4) 5) 6) 7))
4

(define (max x y) _____________________________________)

(define (max-depth lst)
    (define (helper lst curr)
        (cond 
            ((__________) ________________________)

            ((__________) (max ______________________________

                            ________________________________))

            (else (helper ________________________))
        )
    )
    (____________________________)
)


