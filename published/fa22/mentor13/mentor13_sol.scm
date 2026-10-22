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
    (cons operator operands))
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
(define-macro (nand operands)
    `(not (meta-apply and ,operands)))


(define-macro (apply-twice call-expr)
  (list (car call-expr) call-expr)
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
(define-macro (python-if pred if-true if-false)
    (let ((pred-val (eval pred)))
         (if (or (not pred-val) (null? pred-val) (equal? 0 pred-val) (equal? undefined pred-val))
            if-false
            if-true)))


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

(define-macro (combine-num lst) 
  (if (null? lst) 0 
    `(+ ,(car lst)(* 10 (combine-num ,(cdr lst))))
  )
)



(define-macro (censor expr phrase)
    (define (contains-phrase expr)
        (cond 
            ((equal? expr phrase) #t)
            ((or (not (list? expr)) (null? expr)) #f)
            (else (or (contains-phrase (car expr)) (contains-phrase (cdr expr))))))
    (if (contains-phrase expr)
        ''censored
        expr))


