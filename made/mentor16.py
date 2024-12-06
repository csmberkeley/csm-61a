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



