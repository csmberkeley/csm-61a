(define (apply-multiple f n x)
    (if (= n 0)
        x
        (f (apply-multiple f (- n 1) x))))
(define (apply-multiple f n x)
    (if (= n 0)
        x
        (apply-multiple f (- n 1) (f x))))


scm> (cons 1 (cons 2 nil))
scm> (cons 1 '(2 3 4 5))
scm> (cons 1 '(2 (cons 3 nil)))
scm> (cons 1 (2 (cons 3 nil)))
eval: bad function in : (2 (cons 3 nil))
scm> (cons 3 (cons (cons 4 nil) nil))
scm> (define a '(1 2 3))
a
scm> a
(1 2 3)
scm> (car a)
1
scm> (cdr a)
(2 3)
scm> (car (cdr a))
2
(car (cdr (cdr a)))


(define (sixty-ones lst)
    (cond ((or (null? lst) (null? (cdr lst))) 0)
          ((and (= 6 (car lst)) (= 1 (cadr lst))) (+ 1 (sixty-ones (cddr lst))))
          (else (sixty-ones (cdr lst)))))


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
 


(define (argmax lst)
    (define (max-helper lst max-so-far max-index curr-index)
        (cond
            ((null? lst) max-index)
            ((> (car lst) max-so-far) 
                (max-helper (cdr lst) (car lst) curr-index (+ curr-index 1)))
            (else
                (max-helper (cdr lst) max-so-far max-index (+ curr-index 1)))
        )
    )
    (max-helper lst 0 0 0)
)


