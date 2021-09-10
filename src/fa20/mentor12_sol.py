1
scm> (if 0 (/ 1 0) 1)
Error: Zero Division
scm> (and 1 #f (/ 1 0))
#f
scm> (and 1 2 3)
3
scm> (or #f #f 0 #f (/ 1 0))
0
scm> (and (and) (or))
#f
scm> (define a 4)
a
scm> ((lambda (x y) (+ a x y)) 1 2)
7
scm> ((lambda (x y z) (y x z)) 2 / 2)
1
scm> ((lambda (x) (x x)) (lambda (y) 4))
4


scm> (define boom2 (lambda () (/ 1 0)))
scm> (boom2)
(define (boom2) (/ 1 0))


c
scm> (eval 'c)
2
scm> '(cons 1 nil)
(cons 1 nil)
scm> (eval '(cons 1 nil))
(1)
scm> (eval (list 'if '(even? c) 1 2))
1




(or #f (and (+ 1 2) 'apple) (- 5 2))
(define (square x) (* x x))

(+ (square 3) (- 3 2))
(define (add x y) (+ x y))

(add (- 5 3) (or 0 2))


; is-prefix with nested if statements
(define (is-prefix p lst)
    (if (null? p)
        #t
        (if (null? lst)
            #f
            (and
                (= (car p) (car lst))
                (is-prefix (cdr p) (cdr lst))))))

; is-prefix with a cond statement
(define (is-prefix p lst)
    (cond 
        ((null? p) #t)
        ((null? lst) #f)
        (else (and (= (car p) (car lst))
            (is-prefix (cdr p) (cdr lst))))))
 


(define (apply-multiple f n x)
    (if (= n 0)
        x
        (f (apply-multiple f (- n 1) x))))
(define (apply-multiple f n x)
    (if (= n 0)
        x
        (apply-multiple f (- n 1) (f x))))


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



