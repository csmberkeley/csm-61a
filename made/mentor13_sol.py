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
                   
 
(define (sum-every-other lst)
    (cond ((null? lst) 0)
          ((null? (cdr lst)) (car lst))
          (else (+ (car lst)
                   (sum-every-other (cddr lst)) ))))


scm> (waldo '(1 4 waldo))
#t
scm> (waldo '())
#f
scm> (waldo '(1 4 9))
#f

(define (waldo lst))
(define (waldo lst)
    (cond ((null? lst) #f)
          ((eq? (car lst) 'waldo) #t)
          (else (waldo (cdr lst)))
      )
  )


(define (waldo lst)
    (if (null? lst)
        #f
        (if (eq? (car lst) 'waldo)
            #t
            (waldo (cdr lst))
        )
    )
)
scm> (waldo '(1 4 waldo))
2
scm> (waldo '())
#f
scm> (waldo '(1 4 9))
#f

(define (waldo lst)















)
(define (waldo lst)
    (define (helper lst index)
        (cond ((null? lst) #f)
              ((eq? (car lst) 'waldo) index)
              (else (helper (cdr lst) (+ index 1)))
          )
      )
    (helper lst 0)
  )


> (append '(1 2 3) '(4 5 6))
(1 2 3 4 5 6)

(define (append lst1 lst2)






)
(define (append lst1 lst2)
    (if (null? lst1) lst2        
        (cons (car lst1) (append (cdr lst1) lst2))))
> (reverse '(1 2 3))
(3 2 1)

(define (reverse lst)






)
(define (reverse lst)
    (if (null? lst) lst
        (append (reverse (cdr lst)) (list (car lst)))))








scm> (define c 4)
c
scm> ((define (x) 1))
Error: str is not callable: x
scm> (x)
1
scm> ((lambda (x y) (+ c)) 1 2)
4
scm> (eval 'c)
2
scm> '(cons 1 nil)
(cons 1 nil)
	scm> (eval '(cons 1 nil))
	(1)
scm> (eval (list 'if '(even? c) 1 2))
1
scm> (let ((a (+ 3 1)) (b 3)) (+ a b) (/ a b))
1.333333333333333


(if 1 (+ 2 3) (/ 1 0))
(or #f (and (+ 1 2) 'apple) (- 5 2))
(define (square x) (* x x))

(+ (square 3) (- 3 2))
(define (add x y) (+ x y))

(add (- 5 3) (or 0 2))


            (define (plan-coffee-tour lst1 lst2)
                (cond ((null? lst1) lst2)
                    ((null? lst2) lst1)
                    (else
                        (let ((first (car lst1))
                            (rest1 (cdr lst1))
                            (rest2 (filter (lambda (shop) (not (eq? shop (car lst1)))) lst2)))
                        (if (null? rest2)
                            (cons first (plan-coffee-tour rest1 rest2))
                            (cons first (cons (car rest2)
                                                (plan-coffee-tour rest1 (cdr rest2)))))))))



