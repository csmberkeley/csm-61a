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
scm> (cons 3 (cons (cons 4 nil) nil))
scm> (define a '(1 2 3))
scm> a
scm> (car a)
scm> (cdr a)
scm> (car (cdr a))


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


(define (argmax lst)
    (define (max-helper lst max-so-far max-index curr-index)
        (cond

            ((__________________) _________________________)

            ((__________________) ________________________ 

                ________________________________)

            (else _________________________________________)
        )
    )

    (max-helper _______________________)
)


