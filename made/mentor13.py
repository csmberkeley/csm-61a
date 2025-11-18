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


; Doctests
scm> (meta-apply + (1 2)) 
3
scm> (meta-apply or (#t (/ 1 0) #f))
#t
(define-macro (meta-apply operator operands)
    

)
(define-macro (meta-apply operator operands)
    `(,operator ,operands))


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



; doctests
scm> (and-odds '((= 10 10)))
#t
scm> (and-odds '((= 1 2)))
#f
scm> (and-odds '(#f #t #t))
#f
scm> (and-odds '((< 5 3) (= 5 5)))
#f
scm> (and-odds '((> 3 2) (< 5 0) (= 5 5)))
#t
scm> (and-odds '((< 1 5) (< 5 2) (< 3 5) (< 5 3) (< 4 5)))
#t
scm> (define a (list 1 #f 3))
a
scm> (and-odds a)
3
(define-macro (and-odds exprs)
    `(if _________________________________________________

         _________________________________________________

         _________________________________________________
    )
)


