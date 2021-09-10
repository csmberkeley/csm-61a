; Implement if-macro, which behaves similarly to the if special form in Scheme but
; has some additional properties. Here’s how the if-macro is called:
; if <cond1> <expr1> elif <cond2> <expr2> else <expr3>
; If cond1 evaluates to a truth-y value, expr1 is evaluated and returned. Otherwise, if
; cond2 evaluates to a truth-y value, expr2 is evaluated and returned. If neither 
; condition is true, expr3 is evaluted and returned.

;Doctests
scm> (if-macro (= 1 0) 1 elif (= 1 1) 2 else 3)
2
scm> (if-macro (= 1 1) 1 elif (= 2 2) 2 else 3)
1
scm> (if-macro (= 1 0) (/ 1 0) elif (= 2 0) (/ 1 0) else 3)
3

(define-macro (if-macro cond1 expr1 elif cond2 expr2 else expr3)













)




; Implement apply-twice, which is a macro that takes in a call expression with a
; single argument. It should return the result of applying the operator to the operand twice.

;Doctests
scm> (define add-one (lambda (x) (+ x 1)))
add-one
scm> (apply-twice (add-one 1))
3
scm> (apply-twice (print 'hi))
hi
undefined

(define-macro (apply-twice call-expr)

    `(let ((operator _______________________)

            (operand  _______________________))

            (___________________________________________)))


