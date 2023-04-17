;doctests
scm> (apply-multiple (lambda (x) (* x x)) 3 2)
256
scm> (apply-multiple (lambda (x) (+ x 1)) 10 1)
11
scm> (apply-multiple (lambda (x) (* 1000 x)) 0 5)
5


(define (apply-multiple f n x)

















)


scm> (cons 1 (cons 2 nil))
scm> (cons 1 '(2 3 4 5))
scm> (cons 1 '(2 (cons 3 nil)))
scm> (cons 1 (2 (cons 3 nil)))
scm> (cons 3 (cons (cons 4 nil) nil))
scm> (define a '(1 2 3))
scm> a
scm> (car a)
scm> (cdr a)
scm> (car (cdr a))


> (sixty-ones '(4 6 1 6 0 1))
1
> (sixty-ones '(1 6 1 4 6 1 6 0 1))
2
> (sixty-ones '(6 1 6 1 4 6 1 6 0 1))
3


;Doctests
scm> (binary (list #f #t)) ; 10
2
scm> (binary (list #t #f #t #t)) ; 1101
13
scm> (binary (list #t #t #f #f #t)) ; 10011
19
scm> (binary (list #f)) ; 0
0

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
;Doctests
scm> (binary-tail (list #f #t)) ; 10
2
scm> (binary-tail (list #t #f #t #t)) ; 1101
13
scm> (binary-tail (list #t #t #f #f #t)) ; 10011
19
scm> (binary-tail (list #f)) ; 0
0

(define (binary-tail bin-list)
  (define (helper bin-list i sum)
    (cond
      ((null? ____________)
        __________________
      )
      ((__________________)
        ______________________________________________
      )
      (else
        ______________________________________________
      )
    )
  )
  (helper ________________)
)


; Doctests:
scm> (is-prefix '() '())
#t
scm> (is-prefix '() '(1 2))
#t
scm> (is-prefix '(1) '(1 2))
#t
scm> (is-prefix '(2) '(1 2))
#f
; Note here p is longer than lst
scm> (is-prefix '(1 2) '(1))
#f

(define (is-prefix p lst)


















)


(define (argmax lst)
    (define (max-helper lst max-so-far max-index curr-index)
        (cond

            ((__________________) _________________________)

            ((__________________) ________________________ 

                ________________________________)

            (else _________________________________________)
        )
    )

    (max-helper _______________________)
)


