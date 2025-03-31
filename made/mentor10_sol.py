(if (/ 1 0) 1 0)
Error: Zero Division
(if 1 1 (/ 1 0))
1
(if 0 (/ 1 0) 1)
Error: Zero Division
(and 1 #f (/ 1 0))
#f
(and 1 2 3)
3
(or #f #f 0 #f (/ 1 0))
0
(or #f #f (/ 1 0) 3 4)
Error: Zero Division
(and (and) (or))
#f


scm> (define c 2)
c
scm> (eval 'c)
2
scm> '(cons 1 nil)
(cons 1 nil)
scm> (eval '(cons 1 nil))
(1)
scm> (eval (list 'if '(even? c) 1 2))
1


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


    True or False: 3.14 is an atomic expression.
    True or False: pi is an atomic expression.
    True or False: - is an atomic expression.
    True or False: // is an atomic expression.
    True or False: "is this atomic?" is an atomic expression.


    scm> (+ 1 (* 3 4))
    scm> (* 1 (+ 3 4))
    scm> (/ 2)
    scm> (- 2)
    scm> (* 4 (+ 3 (- 2 (/ 1))))


    scm> (if 2 3 4)
    scm> (if 0 3 4)
    scm> (- 5 (if #f 3 4))
    scm> (cond ((< -5 -7) 3)
          (else 4))


    scm> (and 1 2)
    scm> (or #f 1 2)
    scm> (and #t (= 3 3) (> (- 61 42) (+ 61 42)))
    scm> (or #f (< 3 3) (< (- 61 42) (+ 61 42)))


