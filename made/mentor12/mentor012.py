

(if 1 (+ 2 3) (/ 1 0))
(or #f (and (+ 1 2) 'apple) (- 5 2))
(define (square x) (* x x))

(+ (square 3) (- 3 2))
(define (add x y) (+ x y))

(add (- 5 3) (or 0 2))


scm> (define x 6)
scm> (define y 1)
scm> '(x y a)
scm> `(,x ,y a)
scm> `(,x y a)
scm> `(,(if (- 1 2) '+ '-) 1 2)
scm> (eval `(,(if (- 1 2) '+ '-) 1 2))
scm> (define (add-expr a1 a2)
              (list '+ a1 a2))
scm> (add-expr 3 4)
scm> (eval (add-expr 3 4))
scm> (define-macro (add-macro a1 a2)
            (list '+ a1 a2))
scm> (add-macro 3 4)


; Doctests
scm> (meta-apply + (1 2)) 
3
scm> (meta-apply or (#t (/ 1 0) #f))
#t
(define-macro (meta-apply operator operands)
    

)
(define-macro (meta-apply operator operands)
    `(,operator ,operands))


;Doctests
scm> (nand (#t #t #t #t #t #t))
#f
scm> (nand (#t #f #t))
#t
scm> (nand (#f (/ 1 0)))
#t
(define-macro (nand operands))


)


;Doctests
scm> (define add-one (lambda (x) (+ x 1)))
add-one
scm> (apply-twice (add-one 1))
3
scm> (apply-twice (print 'hi))
hi
undefined

(define-macro (apply-twice call-expr)
		_______________________
)



;Doctests
scm> (censor ((lambda (stanford tree) (+ stanford tree)) 4 5) stanford)
censored
scm> (censor ((lambda (stanford tree) (+ stanford tree)) 4 5) tree)
censored
scm> (censor ((lambda (stanford tree) (+ stanford tree)) 4 5) ree)
9

(define-macro (censor expr phrase)
    (define (contains-phrase expr)
    
    
    
    
    
    
    )
    (if ________________________________________

        ________________________________________

        ________________________________________))


