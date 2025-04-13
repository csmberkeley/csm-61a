(if (/ 1 0) 1 0)
(if 1 1 (/ 1 0))
(if 0 (/ 1 0) 1)
(and 1 #f (/ 1 0))
(and 1 2 3)
(or #f #f 0 #f (/ 1 0))
(or #f #f (/ 1 0) 3 4)
(and (and) (or))


scm> (define c 2)
scm> (eval 'c)
scm> '(cons 1 nil)
scm> (eval '(cons 1 nil))
scm> (eval (list 'if '(even? c) 1 2))


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

    (if (___________)

        ____________

        (if (___________(___________________________))

            (___________

                (____________________)

                (____________________)
            )

            (___________

                (+ ____ (* ___________))

                (__________)
            )
        )
    )
)
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


