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


(define (six-sevens lst)
    (cond ((or (null? lst) (null? (cdr lst))) 0)
          ((and (= 6 (car lst)) (= 7 (car (cdr lst)))) (+ 1 (six-sevens (cdr(cdr lst)))))
          (else (six-sevens (cdr lst)))))


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
            total = total + lst[i]
        except IndexError:
            return total
        except TypeError:
            i += 1
            continue
        i += 1


