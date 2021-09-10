scm> (if 1 1 (/ 1 0))


scm> (define boom1 (/ 1 0))


scm> (define c 2)




(if 1 (+ 2 3) (/ 1 0))


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


;doctests
scm> (apply-multiple (lambda (x) (* x x)) 3 2)
256
scm> (apply-multiple (lambda (x) (+ x 1)) 10 1)
11
scm> (apply-multiple (lambda (x) (* 1000 x)) 0 5)
5


(define (apply-multiple f n x)

















)


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


