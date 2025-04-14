

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



(define-macro (censor expr phrase)
    (define (contains-phrase expr)
        (cond 
            ((equal? expr phrase) #t)
            ((or (not (list? expr)) (null? expr)) #f)
            (else (or (contains-phrase (car expr)) (contains-phrase (cdr expr))))))
    (if (contains-phrase expr)
        ''censored
        expr))


