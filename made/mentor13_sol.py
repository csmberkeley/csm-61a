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
    (cons operator operands))
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

(define-macro (combine-num lst) 
  (if (null? lst) 0 
    `(+ ,(car lst)(* 10 (combine-num ,(cdr lst))))
  )
)



(define-macro (and-odds exprs)
    `(if (> (length ,exprs) 2)
          (and (car ,exprs) (and-odds (cdr (cdr ,exprs))))
          (eval (car ,exprs))
    )
)


