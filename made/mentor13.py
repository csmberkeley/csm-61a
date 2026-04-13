> (sum-every-other '(1 2 3))
4
> (sum-every-other '())
0
> (sum-every-other '(1 2 3 4))
4
> (sum-every-other '(1 2 3 4 5))
9
(define (sum-every-other lst)
    (cond ((null? lst) lst)
          (else (+ (cdr lst)
                   (sum-every-other (car lst))))))
                   
 


scm> (waldo '(1 4 waldo))
#t
scm> (waldo '())
#f
scm> (waldo '(1 4 9))
#f

(define (waldo lst))
scm> (waldo '(1 4 waldo))
2
scm> (waldo '())
#f
scm> (waldo '(1 4 9))
#f

(define (waldo lst)















)


> (append '(1 2 3) '(4 5 6))
(1 2 3 4 5 6)

(define (append lst1 lst2)






)
> (reverse '(1 2 3))
(3 2 1)

(define (reverse lst)






)








scm> (define c 4)
scm> ((define (x) 1))
scm> (x)
scm> ((lambda (x y) (+ c)) 1 2)
scm> (eval 'c)
scm> '(cons 1 nil)
	scm> (eval '(cons 1 nil))
scm> (eval (list 'if '(even? c) 1 2))
scm> (let ((a (+ 3 1)) (b 3)) (+ a b) (/ a b))


(if 1 (+ 2 3) (/ 1 0))
(or #f (and (+ 1 2) 'apple) (- 5 2))
(define (square x) (* x x))

(+ (square 3) (- 3 2))
(define (add x y) (+ x y))

(add (- 5 3) (or 0 2))


        scm> (plan-coffee-tour '(binge strada philz) '(philz blue-bottle binge))
        (binge philz strada blue-bottle)
        
        scm> (plan-coffee-tour '(strada mind peets) '(elaichi-co philz))
        (strada elaichi-co mind philz peets)
        
        scm> (plan-coffee-tour '(strada qargo) '(strada qargo peets))
        (strada qargo peets)
        
        scm> (plan-coffee-tour '() '(delah signal))
        (delah signal)

        (define (plan-coffee-tour lst1 lst2)
            (cond ((________________________) lst2)
                ((________________________) lst1)
                (else
                (let ((first (car lst1))
                        (rest1 (cdr lst1))
                        (rest2 (________________________)))
                    (if (________________________)
                        (cons first (plan-coffee-tour rest1 rest2))
                        (cons first (cons (________________________)
                                        (plan-coffee-tour rest1 (________________________)))))))))


