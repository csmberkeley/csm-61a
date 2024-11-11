;doctests
scm> (apply-multiple (lambda (x) (* x x)) 3 2)
256
scm> (apply-multiple (lambda (x) (+ x 1)) 10 1)
11
scm> (apply-multiple (lambda (x) (* 1000 x)) 0 5)
5


(define (apply-multiple f n x)


	  _________________________________
	  
	  _________________________________
	  
	  _________________________________
	  

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

(define (sixty-ones lst)
    (cond (____________________________________________)
          (_______________________________________________________________________)
          (else ______________________________)))


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

	___________________________
	
	___________________________
	
	___________________________
	
	___________________________
	
	___________________________
	
	___________________________
	


)


(define (argmax lst)
    (define (max-helper lst max-so-far max-index curr-index)
        (cond

            ((__________________) ________________________)

            ((__________________) ________________________ 

                __________________________________________________________)

            (else ___________________________________________________________)
        )
    )

    (max-helper _______________________)
)


