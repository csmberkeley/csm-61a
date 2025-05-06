fruit = [1, 2, [3, 4]]
fruit.append(fruit)
fruit[3][2].append([5, 6])
fruit[2][2].append(fruit[2])
fruit[3][3][2][2][2][1] = 4


def root_to_leaf(t):
    if t.is_leaf():
        yield [t.label]
    for b in t.branches:
        if t.label <= b.label:
            for path in root_to_leaf(b):
                yield [t.label] + path
def subpaths(t):
    yield from root_to_leaf(t)
    for b in t.branches:
        yield from subpaths(b)
  def all_paths(t):
      if t.is_leaf():
          return [[t.label]]
      paths = []
      for b in t.branches:
          for path in all_paths(b):
              paths.append([t.label] + path)
      return paths


    if len(bookshelf['books']) == bookshelf['size']:
        print('Bookshelf is full!')
    else:
        if author in bookshelf['books']:
            bookshelf['books'][author].append(title)
        else:
            bookshelf['books'][author] = [title]
        return list(bookshelf['books'].keys())
        return max(get_all_authors(bookshelf), key=lambda x: len(get_author_books(x))


def hiii(m):
    word = "h"
    for i in range(m):
        word += "i"
    return word

def hiya(n):
    i = 1
    while i < n:
        print(hiii(i))
        i *= 2




        def fruitOptions(m, pc, ac): 
            if m < pc and m < ac:
                yield ""
            if m >= pc:
                for p in fruitOptions(m-pc, pc, ac):
                    yield "pear " + p;
            if m >= ac:
                for a in fruitOptions(m-ac, pc, ac):
                    yield "apple " + a;    


        a = [1, 'A', 'B', 'C', 5, 6, 7, 'D', 'E']
        x = iter(a)
        for i in range(5 - next(x)):
            next(x)
        print(next(x))
        y = iter(a)
        print(next(y))
        z = iter(y)
        print(next(z))        
        6
        1
        A


        def year(a):
            x = iter(a)
            y = iter(a)
            z = iter(x)
            for i in range(next(x)):
                y = iter(a)
                next(y)
            print(next(x))
            print(next(z))
            print(next(y))
            print(next(z))


def reverse(strand):
    """Reverses a DNA strand 
    >>> d = Link("C", Link("A", Link("C", Link("G"))))  \# <C A C G>
    >>> reverse(d)
    >>> print(d)
    <G C A C>
    """
    assert isinstance(strand, Link)
    if strand is Link.empty or strand.rest is Link.empty:
        return strand
    reverse(strand.rest)
    strand.rest.rest = strand
    strand.rest = Link.empty
    return strand




        def findFrameShift(original, mutated):
        """Return the number of nucleotides that original has been shifted by after being mutated
        >>> o = Link("C", Link("A", Link("C", Link("G", Link("T", Link ("A")))))) 
         <C A C G T A>
        >>> m = Link("C", Link("G", Link("T", Link ("A")))) 
         <C G T A>
        >>> n = findFrameshift(o,m)
        >>> print(n)
        2
        """
        assert isinstance(original, Link)
        assert isinstance(mutated, Link)
        	
        


def rotate(t):
  branch_labels = [b.label for b in t.branches]
  n = len(t.branches)
  for i in range(n):
    branch = t.branches[i]
    branch.label = branch_labels[(i + 1) % n]
    rotate(branch)


def best_study_spot(t, key):
    if t.is_leaf():
        return t.label
    best = t.label
    for b in t.branches:
        candidate = best_study_spot(b, key)
        if key(candidate) > key(best):
            best = candidate
    return best


def is_clone(t):
    if t.is_leaf():
        return True
    if len(t.branches) != 2:
        return False
    left, right = t.branches
    if not (is_clone(left) and is_clone(right)):
        return False
    def count_leaves(t):
        if t.is_leaf():
            return 1
        return sum(count_leaves(b) for b in t.branches)
    return count_leaves(left) == count_leaves(right)


def find_hint(t):
    for b in t.branches:
        find_hint(b)
    t.branches = [b for b in t.branches if not (b.is_leaf() and b.label == "Blank")]


(define (collision lst)
  (cond ((null? lst) nil)
    ((list? (car lst))
      (cons (collision (car lst)) (collision (cdr lst))))
    ((and (equal? (car lst) 0) (not (null? (cdr lst))))
      (cons (list (car (cdr lst)) (car lst))
        (collision (cdr (cdr lst)))))
    (else(cons (car lst) (collision (cdr lst))))
  )
)

#Alternate solution (No cond form)

(define (collision lst)
  (if (null? lst)
    lst
    (if (list? (car lst))
      (cons (collision (car lst)) (collision (cdr lst)))
      (if (equal? (car lst) 0)
        (cons (list (cadr list) (car lst)) (collision (cddr lst)))
        (cons (car lst) (collision (cdr lst)))
      )
    )
  )
)


            (define (plan-coffee-tour lst1 lst2)
                (cond ((null? lst1) lst2)
                    ((null? lst2) lst1)
                    (else
                        (let ((first (car lst1))
                            (rest1 (cdr lst1))
                            (rest2 (filter (lambda (shop) (not (eq? shop (car lst1)))) lst2)))
                        (if (null? rest2)
                            (cons first (plan-coffee-tour rest1 rest2))
                            (cons first (cons (car rest2)
                                                (plan-coffee-tour rest1 (cdr rest2)))))))))




            (define-macro (unless condition body)
                (list 'if (list 'not condition) body))



            
            (define (build-plot-outline characters events)
            (cond ((or (null? characters) (null? events)) '())
                    (else
                    (let ((c (car characters))
                        (e (car events)))
                    (if (or (eq? c 'plot-hole) (eq? e 'plot-hole))
                        (build-plot-outline (cdr characters) (cdr events))
                        (cons (cons c e)
                                (build-plot-outline (cdr characters) (cdr events))))))))



