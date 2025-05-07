fruit = [1, 2, [3, 4]]
fruit._______________________
fruit[3][2]._________________
fruit[2][2]._________________
fruit[3][3][2][2][2][1] = ___


def root_to_leaf(t):
    """
    >>> t1 = Tree(3, [Tree(5), Tree(4)])
    >>> list(root_to_leaf(t1))
    [[3, 5], [3, 4]]
    >>> t2 = Tree(5, [Tree(2, [Tree(7), Tree(8)]), Tree(5, [Tree(6)])])
    [[5, 5, 6]]
    """

    if ____________________:

        _________________________

    for _________________________:

        if __________________________:

            for __________________________:

                ______________________________
def subpaths(t):

    yield from _______________________

    for b in t.branches:

        ______________________________
  def all_paths(t):
      if t.is_leaf():
          return [[t.label]]
      paths = []
      for b in t.branches:
          for path in all_paths(b):
              paths.append([t.label] + path)
      return paths


def Bookshelf(capacity):
    """ Creates an empty bookshelf with a certain max capacity. """
    return {'size': capacity, 'books': {}}

def add_book(bookshelf, author, title):
    """
    Adds a book to the bookshelf. If the bookshelf is full,
    print "Bookshelf is full!" and do not add the book.
    >>> books = Bookshelf(2)
    >>> add_book(books, 'Jane Austen', 'Pride and Prejudice')
    >>> add_book(books, 'Daniel Kleppner', 'An Introduction to Mechanics 5th Edition')
    >>> add_book(books, 'Kurt Vonnegut', 'Galapagos')
    Bookshelf is full!
    """
    if _______________________________:
        print('Bookshelf is full!')
    else:
        if author in bookshelf['books']:
            ____________________________________
        else:
            ____________________________________
def get_all_authors(bookshelf):
    """
    Returns a list of all authors who have at least one book in the bookshelf.
    >>> books = Bookshelf(10)
    >>> add_book(books, 'Jane Austen', 'Pride and Prejudice')
    >>> add_book(books, 'Sheldon Axler', 'Linear Algebra Done Right')
    >>> add_book(books, 'Kurt Vonnegut', 'Galapagos')
    >>> get_all_authors(books)
    ['Jane Austen', 'Sheldon Axler', 'Kurt Vonnegut']
    """
    return ___________________________________
def most_popular_author(bookshelf):
    """
    Returns the author with the greatest number of books on this bookshelf.
    You can assume that the bookshelf is not empty.
    >>> books = Bookshelf(100)
    >>> add_book(books, 'Orson Scott Card', 'Xenocide')
    >>> add_book(books, 'Orson Scott Card', 'Children of the Mind')
    >>> add_book(books, 'J.R.R. Tolkien', 'The Hobbit')
    >>> most_popular_author(bookshelf)
    'Orson Scott Card'
    """
    return max(________________________________________________, 
        
        key=_______________________________________________________)


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
        """
        >>> print(list(fruitOptions(10, 2, 5)))
        ['pear pear pear pear pear ', 'pear pear apple ', 'pear apple pear ',
         'apple pear pear ', 'apple apple ']
        """
        if __________________________________:
            yield ""
        if m >= pc:
            for ______________________________________:
                ________________________________
        if m >= ac:
            for ______________________________________:
                ____________________________________
                


        a = [1, 'A', 'B', 'C', 5, 6, 7, 'D', 'E']
        x = iter(a)
        for i in range(5 - next(x)):
            next(x)
        print(next(x))
        y = iter(a)
        print(next(y))
        z = iter(y)
        print(next(z))        


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
    >>> d = Link("C", Link("A", Link("C", Link("G")))) \# <C A C G>
    >>> reverse(d)
    >>> print(d)
    <G C A C>
    """
    assert isinstance(strand, Link)
    if ______________:
        return _____
    reverse(___________)
    __________________
    __________________
    return strand


def isEqual(strand1, strand2):
    """Returns if the two strands are equal 
    >>> d = Link("C", Link("A", Link("C", Link("G")))) 
   	 <C A C G>
    >>> g = Link("C", Link("A", Link("C", Link("G")))) 
     <C A C G>
    >>> isEqual(d, g)
    True
    >>> f = Link("C", Link("C", Link("G")))
     <C C G>
    >>> isEequal(d, f)
    False
    >>> n = Link("C", Link("T", Link("C", Link("G")))) 
     <C T C G>
    >>> isEqual(d, n)
    False
    """
    assert isinstance(strand1, Link)
    assert isinstance(strand2, Link)
    

	____________________________

	____________________________

	____________________________

	____________________________

	____________________________

	____________________________

	____________________________

 


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
  """
  >>> t1 = Tree(1, [Tree(2), Tree(3, [Tree(4)]), Tree(5)])
  >>> rotate(t1)
  >>> t1
  Tree(1, [Tree(3), Tree(5, [Tree(4)]), Tree(2)])
  >>> t2 = Tree(1, [Tree(2, [Tree(3), Tree(4)]), 
                    Tree(5, [Tree(6)])])
  >>> rotate(t2)
  >>> t2
  Tree(1, [Tree(5, [Tree(4), Tree(3)]), 
                    Tree(2, [Tree(6)])])
  """
  branch_labels = ___________________________________

  n = len(t.branches)

  for ______________________________________:

    ______________________________________________

    ______________________________________________
    
    ______________________________________________ 


def best_study_spot(t, key):
    """Return the node in t that corresponds to the maximum value for key without using min or max.

    >>> t = Tree(7, [Tree(5, [Tree(9)]), Tree(3), Tree(10, [Tree(4)])])
    >>> best_study_spot(t, key=lambda x: x)
    10
    >>> best_study_spot(t, key=lambda x: -x)
    3
    >>> best_study_spot(t, key=lambda x: -abs(x - 4))
    4
    """
    if t.________():
        return ________
    best = ________
    for b in ________:
        candidate = best_study_spot(b, key)
        if ________(candidate) > key(best):
            ________ = candidate
    return ________


def is_clone(t):
    """Return True if t is an exactly balanced tree and False if not.

    >>> t1 = Tree(1)
    >>> is_clone(t1)
    True
    >>> t2 = Tree(1, [Tree(2), Tree(3)])
    >>> is_clone(t2)
    True
    >>> t3 = Tree(1, [Tree(2, [Tree(4), Tree(5)]), Tree(3)])
    >>> is_clone(t3)
    False
    """
    if t.is_leaf():
        return True
    if ___________:
        return False
    
    left, right = t.branches
    if not (is_clone(left) and is_clone(right)):
        return False
    
    def count_leaves(t):
        if t.is_leaf():
            return 1
        return sum(________)
    
    return count_leaves(left) == __________


def find_hint(t):
    """Mutates the tree t so that it only keeps paths that do NOT end in a leaf labeled "Blank".

    >>> t1 = Tree("Start", [Tree("A", [Tree("Blank")]), Tree("B", [Tree("C")]), Tree("Blank")])
    >>> find_hint(t1)
    >>> print(t1)
    Tree('Start', [Tree('B', [Tree('C')])])
    >>> t2 = Tree("Start", [Tree("A", [Tree("B", [Tree("Blank")])]), Tree("X", [Tree("Y")])])
    >>> find_hint(t2)
    >>> print(t2)
    Tree('Start', [Tree('X', [Tree('Y')])])
    """
    for b in t.branches:
        find_hint(b)
    t.branches = [b for b in t.branches if not (b.is_leaf() and b.label == ____________________)]


;Doctests
scm> (collision (list 1 2 3 0 4))
(1 2 3 (4 0))
scm> (collision (list 4 3 (list 0 1) 2))
(4 3 ((1 0)) 2)
scm> (collision (list 1 -2 0 -3 4 0 -5 6))
(1 -2 (-3 0) 4 (-5 0) 6)
scm> (collision (list 1 0 0 2 3))
(1 (0 0) 2 3) 

;Asteroids can merge with other asteroids too

(define (collision lst)

  (cond ((_____________________) lst)

    ((___________________________)

      __________________________________)

    ((___________________________)

      (cons ____________________________

        __________________________________))

    (else _________________________________)
  )
)



        scm> (plan-coffee-tour '(binge strada philz) '(philz blue-bottle binge))
        (binge philz strada blue-bottle)
        
        scm> (plan-coffee-tour '(strada mind peets) '(elaichi-co philz))
        (strada elaichi-co mind philz peets)
        
        scm> (plan-coffee-tour '(strada qargo) '(strada qargo peets))
        (strada qargo peets)
        
        scm> (plan-coffee-tour '() '(delah signal))
        (delah signal)

        (define (plan-coffee-tour lst1 lst2)
            (cond ((________________________) lst2)
                ((________________________) lst1)
                (else
                (let ((first (car lst1))
                        (rest1 (cdr lst1))
                        (rest2 (________________________)))
                    (if (________________________)
                        (cons first (plan-coffee-tour rest1 rest2))
                        (cons first (cons (________________________)
                                        (plan-coffee-tour rest1 (________________________)))))))))


        scm> (unless #f (print 'nope))
        nope
        scm> (unless #t (print 'nope))
        ; nothing is printed

       (define-macro (unless condition body)
            (________________________))



        scm> (build-plot-outline '(hero villain plot-hole bard) '(battle scheme rescue plot-hole))
        ((hero . battle) (villain . scheme) (bard . rescue))

        scm> (build-plot-outline '(dragon knight) '(flight plot-hole))
        ((dragon . flight))

        scm> (build-plot-outline '(plot-hole) '(plot-hole))
        ()

        scm> (build-plot-outline '() '(event1 event2))
        ()
        
        (define (build-plot-outline characters events)
            (cond ((__________________________) '())
                    (else
                    (let ((c (car characters))
                        (e (car events)))
                    (if (__________________________)
                        (build-plot-outline (__________________________) (__________________________))
                        (cons (__________________________)
                                (build-plot-outline (__________________________) (__________________________))))))))



