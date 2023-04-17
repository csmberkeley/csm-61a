;doctests
scm> (apply-multiple (lambda (x) (* x x)) 3 2)
256
scm> (apply-multiple (lambda (x) (+ x 1)) 10 1)
11
scm> (apply-multiple (lambda (x) (* 1000 x)) 0 5)
5


(define (apply-multiple f n x)

















)
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


> (sixty-ones '(4 6 1 6 0 1))
1
> (sixty-ones '(1 6 1 4 6 1 6 0 1))
2
> (sixty-ones '(6 1 6 1 4 6 1 6 0 1))
3
(define (sixty-ones lst)
    (cond ((or (null? lst) (null? (cdr lst))) 0)
          ((and (= 6 (car lst)) (= 1 (cadr lst))) (+ 1 (sixty-ones (cddr lst))))
          (else (sixty-ones (cdr lst)))))


(define (binary bin-list)
  (cond
    ((null? bin-list)
      0
    )
    ((car bin-list)
      (+ 1 (* 2 (binary (cdr bin-list))))
    )
    (else
      (* 2 (binary (cdr bin-list)))
    )
  )
)
(define (binary-tail bin-list)
  (define (helper bin-list i sum)
    (cond
      ((null? bin-list)
        sum
      )
      ((car bin-list)
        (helper
          (cdr bin-list) (+ 1 i) (+ sum (expt 2 i))
        )
      )
      (else
        (helper
          (cdr bin-list) (+ 1 i) sum
        )
      )
    )
  )
  (helper bin-list 0 0)
)


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


















)
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


