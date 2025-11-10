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


scm> (define c 4)
scm> ((define (x) 1))
scm> (x)
scm> ((lambda (x y) (+ c)) 1 2)
scm> (eval 'c)
scm> '(cons 1 nil)
	scm> (eval '(cons 1 nil))
scm> (eval (list 'if '(even? c) 1 2))
scm> (let ((a (+ 3 1)) (b 3)) (+ a b) (/ a b))


> (six-sevens '(4 6 7 6 0 7))
1
> (sixty-ones '(7 6 7 4 6 7 6 0 7))
2
> (sixty-ones '(6 7 6 7 4 6 7 6 0 7))
3

(define (six-sevens lst)
    (cond (____________________________________________)
          (_______________________________________________________________________)
          (else ______________________________)))


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


def list_sum(lst):
    '''
    >>> list_sum([1, 2, 3, 4, 5])
    15
    >>> list_sum([1, '2', 3, '4', 5])
    9
    >>> list_sum(['1', '2', 3, 4, 5])
    12
    '''
    i = 0
    total = 0
    while True:
        try:
            ____________
        except ____________:
            return ____________
        except ____________:
            ____________
            continue
        i += 1


