scm> 3.14
scm> pi
scm> (define pi 3.14)
scm> pi
scm> 'pi
scm> (+ 1 2)
scm> (+ 1 (* 3 4))
scm> (if 2 3 4)
scm> (if 0 3 4)
scm> (- 5 (if #f 3 4))
scm> (if nil 3 4)
scm> (if (= 1 1) 'hello 'goodbye)
scm> (define (factorial n)
        (if (= n 0)
            1
            (* n (factorial (- n 1)))))
scm> (factorial 5)
scm> (= 2 3)
scm> (= '() '())
scm> (eq? '() '())
scm> (eq? nil nil)
scm> (eq? '() nil)
scm> (pair? (cons 1 2))
scm> (list? (cons 1 2))


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


; The hailstone sequence starting at seed = 10 would be
; 10 => 5 => 16 => 8 => 4 => 2 => 1

; Doctests
> (hailstone 10 0)
10
> (hailstone 10 1)
5
> (hailstone 10 2)
16
> (hailstone 5 1)
16

(define (hailstone seed n)










)
(define (hailstone seed n)
    (if (= n 0)
        seed
        (if (= 0 (remainder seed 2))
            (hailstone
            (quotient seed 2)
            (- n 1))
          (hailstone
          (+ 1 (* seed 3))
          (- n 1)))))

; Alternative solution with cond

(define (hailstone seed n)
    (cond 
        ((= n 0) seed)
        ((= 0 (remainder seed 2))
          (hailstone
          (quotient seed 2)
          (- n 1)))
        (else 
          (hailstone
          (+ 1 (* seed 3))
          (- n 1)))))
def hailstone(seed, n):
    if n == 0:
        return seed
    if seed % 2 == 0:
        return hailstone(seed//2, n - 1)
    else:
        return hailstone(3*seed + 1, n - 1)


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


