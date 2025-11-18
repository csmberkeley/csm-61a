class Link:
    '''A Scheme list is a Link in which rest is a Link or nil.'''
    empty = ()
    def __init__(self, first, rest=empty):
        self.first = first
        self.rest = rest

    # There are also __str__, __repr__, and map methods, omitted here.

nil = Link.empty
>>> Link('*', Link(5, Link(Link('-', Link(10, Link(2, nil))), nil)))
    >>> Link('or', Link(Link('>', Link(5, Link(2, nil))), Link(Link('/', Link(1, Link(2, nil))), nil)))


(+ 1 2)


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


