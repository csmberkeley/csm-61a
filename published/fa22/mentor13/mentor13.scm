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
scm> (meta-apply print (1 2)) 
1
2
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
scm> (python-if (- 1 1) (/ 1 0) 1)
1
scm> (python-if (not #t) (/ 1 0) 2)
2
scm> (python-if (cdr '(1)) (/ 1 0) 3)
3
scm> (python-if (print 4) (/ 1 0) 5)
4
5
scm> (python-if (- 4 3) 6 (/ 1 0))
6

(define-macro (python-if pred if-true if-false)











)


;Doctests
scm> (combine-num (1 2)) 
; 21
scm> (combine-num (2 5 3 5)) 
; 5352
scm> (combine-num (1)) 
; 1
scm> (+ (combine-num (1 2 3 4)) 5)
; 4326      # (4321 + 5)


(define-macro (combine-num lst) 



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


