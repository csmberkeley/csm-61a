(define (sum-list lst)
  (if (null? lst)
    0
    (+ (car lst) (sum-list (cdr lst)))
  )
)
(define (sum-list-tail lst)











)
(define (sum-list-tail lst)
  (define (sum-list-helper lst sofar)
    (if (null? lst)
      sofar
      (sum-list-helper (cdr lst) (+ sofar (car lst)))
    )
  )
  (sum-list-helper lst 0)
)


;Doctests
scm> (filter-lst (lambda (x) (> x 2)) '(1 2 3 4 5))
(3 4 5)

(define (filter-lst f lst)










)
(define (filter-lst f lst)
  (define (filter-tail lst so-far)
     (cond ((null? lst) so-far)
           ((f (car lst)) (filter-tail (cdr lst)
                          (append so-far (list (car lst)))))
           (else (filter-tail (cdr lst) so-far))))
  (filter-tail lst nil))


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
      (cond ((or (null? lst) (>= i j)) nil)
               ((= i 0) (cons (car lst) (slice (cdr lst) i (- j 1))))
               (else (slice (cdr lst) (- i 1) (- j 1)))))
(define (slice lst i j)
    










)
(define (slice lst i j)
  (define (slice-tail lst i j lst-so-far)
      (cond ((or (null? lst) (>= i j)) lst-so-far)
               ((= i 0) (slice-tail (cdr lst) i (- j 1) (append lst-so-far (list (car lst)))))
               (else (slice-tail (cdr lst) (- i 1) (- j 1) lst-so-far))))
  (slice-tail lst i j nil))
(define (slice lst i j)
  (define (slice-tail lst index lst-so-far)
      (cond ((or (null? lst) (= index j)) lst-so-far)
               ((<= i index) (slice-tail (cdr lst) (+ index 1) (append lst-so-far (list (car lst)))))
               (else (slice-tail (cdr lst) (+ index 1) lst-so-far))))
  (if (< i j) (slice-tail lst 0 nil) nil))




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


(define (max x y) (if (> x y) x y))

(define (max-depth lst)
    (define (helper lst curr)
            (cond 
              ((null? lst) curr)
              ((pair? (car lst)) (max (helper (car lst) 
                                              (+ 1 curr)) 
                                 (helper (cdr lst) curr)))
              (else (helper (cdr lst) curr))
            )
      )
    (helper lst 0)
)


