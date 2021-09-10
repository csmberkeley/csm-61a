a = Link("C", Link("A", Link("N", Link("H", Link("I")))))
b = a.rest
a.rest = b.rest.rest
a.rest.rest.rest = b.rest
b.rest = a.rest
a.rest.rest = a
b.rest.rest.rest = b



def __init__(self, value, next=empty, prev=empty):
  self.value = value
  self.next = next
  self.prev = prev
  def add_last(self, value):
    """
    >>> lst = DLList(6)
    >>> lst.add_last(1)
    >>> lst.value
    6
    >>> lst.next.value
    1
    >>> lst.next.prev.value
    6
    """
    pointer = self
    while ________________________________:

      _____________________________________

    _______________ = DLList(____________________________)
def add_last(self, value):
  pointer = self
  while pointer.next != DLList.empty:
    pointer = pointer.next
  pointer.next = DLList(value, DLList.empty, pointer)
  def add_first(self, value):
    """
    >>> lst = DLList('A')
    >>> lst.add_first(1)
    >>> lst.value
    1
    >>> lst.next.value
    'A'
    >>> lst.next.prev.value
    1
    >>> lst.add_first(6)
    >>> lst.value
    6
    >>> lst.next.next.prev.value
    1
    """
    old_first = DLList(____________________________)

    _______________ = _______________________________

    _______________ = _______________________________

    if ______________________________:

      _______________________________________________
def add_first(self, value):
  old_first = DLList(self.value, self.next, self)
  self.value = value
  self.next = old_first
  if old_first.next != DLList.empty:
    old_first.next.prev = old_first


def fast_exp(b, n):
    if n == 0:
        return 1
    elif n % 2 == 0: # Assume square runs in constant time
        return square(fast_exp(b, n // 2))
    else:
        return b * fast_exp(b, n - 1)
def fast_exp(b, n):
    for _ in range(50 * n):
        print("Killing time")
    if n == 0:
        return 1
    elif n % 2 == 0:
        return square(fast_exp(b, n // 2))
    else:
        return b * fast_exp(b, n - 1)


def rotate(t):
  branch_labels = [b.label for b in t.branches]
  n = len(t.branches)
  for i in range(n):
    branch = t.branches[i]
    branch.label = branch_labels[(i + 1) % n]
    rotate(branch)


    if t.is_leaf():
        yield [t.label]
    for b in t.branches:
        for subpath in all_paths(b):
            yield [t.label] + subpath


    if len(lst) == 0:
        yield 0
    else:
        for sum_rest in all_sums(lst[1:]):
            yield sum_rest + lst[0]
            yield sum_rest


def combine_to_61(lst): 
    def helper(lst, num_so_far): 	
        if num_so_far == 61: 
            return True 
        elif not lst: 
            return False 
        with_sum = num_so_far + lst[0] <= 61 and helper(lst[1:], num_so_far + lst[0]) 
        with_mul =  num_so_far * lst[0] <= 61 and helper(lst[1:], num_so_far * lst[0]) 
        return with_sum or with_mul 
    return helper(lst, 0)


def iter_link(lnk):
  if lnk is not Link.empty:
    if type(lnk.first) is Link:
      yield from iter_link(lnk.first)
    else:
      yield lnk.first
    yield from iter_link(lnk.rest)
  def iter_link(lnk):
    if lnk is not Link.empty:
      yield lnk.first
    yield from iter_link(lnk.rest)


def combine_two(lnk, fn):
    if lnk is Link.empty:
        return Link.empty
    elif lnk.rest is Link.empty:
        return Link(lnk.first)
    combined = fn(lnk.first, lnk.rest.first)
    return Link(combined, combine_two(lnk.rest.rest, fn))


def make_digit_remover(i):
    def remove(n):
        removed = n
        while removed > 0:
            digit = removed % 10
            removed = removed // 10
            if digit == i:
                return removed
        return n
    return remove


def curry_forever (f, arg_num, base=0):
    def helper(arg_num, amt)
   	    if arg_num == 0:
   		    return amt
   	    return lambda x: helper(arg_num - 1, f(amt, x))
    return helper(arg_num, base)



(define (binary bin-list)
  (cond
    ((null? bin-list)
      0
    )
    ((car bin-list)
      (+ 1 (* 2 (binary (cdr bin-list))))
    )
    (else
      (* 2 (binary (cdr bin-list)))
    )
  )
)
;Doctests
scm> (binary-tail (list #f #t)) ; 10
2
scm> (binary-tail (list #t #f #t #t)) ; 1101
13
scm> (binary-tail (list #t #t #f #f #t)) ; 10011
19
scm> (binary-tail (list #f)) ; 0
0

(define (binary-tail bin-list)
  (define (helper bin-list i sum)
    (cond
      ((null? ____________)
        __________________
      )
      ((__________________)
        ______________________________________________
      )
      (else
        ______________________________________________
      )
    )
  )
  (helper ________________)
)
(define (binary-tail bin-list)
  (define (helper bin-list i sum)
    (cond
      ((null? bin-list)
        sum
      )
      ((car bin-list)
        (helper
          (cdr bin-list) (+ 1 i) (+ sum (expt 2 i))
        )
      )
      (else
        (helper
          (cdr bin-list) (+ 1 i) sum
        )
      )
    )
  )
  (helper bin-list 0 0)
)


(define duplicate
	(lambda (lst n)
		(cond ((null? lst) '())
			((< n (car lst)) 
				(cons (car lst) (duplicate lst (+ n 1)))
			)
          		(else 
          			(duplicate (cdr lst) 0)
	   		)
     		)
   	)
)


(define (slice lst i j)
      (cond ((or (null? lst) (>= i j)) nil)
               ((= i 0) (cons (car lst) (slice (cdr lst) i (- j 1))))
               (else (slice (cdr lst) (- i 1) (- j 1)))))
(define (slice lst i j)
    










)
(define (slice lst i j)
  (define (slice-tail lst i j lst-so-far)
      (cond ((or (null? lst) (>= i j)) lst-so-far)
               ((= i 0) (slice-tail (cdr lst) i (- j 1) (append lst-so-far (list (car lst)))))
               (else (slice-tail (cdr lst) (- i 1) (- j 1) lst-so-far))))
  (slice-tail lst i j nil))
(define (slice lst i j)
  (define (slice-tail lst index lst-so-far)
      (cond ((or (null? lst) (= index j)) lst-so-far)
               ((<= i index) (slice-tail (cdr lst) (+ index 1) (append lst-so-far (list (car lst)))))
               (else (slice-tail (cdr lst) (+ index 1) lst-so-far))))
  (if (< i j) (slice-tail lst 0 nil) nil))


