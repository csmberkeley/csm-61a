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
    >>> Link('+', Link(1, Link(Link('*', Link(Link('-', Link(5, Link(2, nil))), Link(Link('+', Link(3, Link(1, nil))), nil))), Link(5, nil))))


(+ 1 2)


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


;Doctests
scm> (combine-num (1 2)) 
; 21
scm> (combine-num (2 5 3 5)) 
; 5352
scm> (combine-num (1)) 
; 1
scm> (+ (combine-num (1 2 3 4)) 5)
; 4326      # (4321 + 5)


(define-macro (combine-num lst) 



)



