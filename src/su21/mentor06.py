

a = [0]
def recurses(x):
    if x == 0:
        return _______________
    elif type(x) == int:
        a[0] += x
        return _______________
    else:
        return ______________\
        ______________________
recurses(lambda x: x * x)


>>> make_interval = _____________________________________
>>> in_interval = make_interval(-1, 2)
>>> in_interval(0)
True
>>> in_interval(61)
False



def make_alternator(f, g):
    """
    >>> a = make_alternator(lambda x: x * x, lambda x: x + 4)
    >>> a(5)
    1
    6
    9
    8
    25
    """
    pass


def partial_summer(lst):
    """
    >>> lst = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    >>> f = partial_summer(lst)(3)
    7 # 7 = (1+1) + (2/2) + (3+1)
    >>> g = f(4)
    19 # 19 = (4/2) + (5+1) + (6/2) + (7+1)
    >>> h = g(3)
    14 # 14 = (8/2) + (9+1)
    >>> i = h(1)
    0	
    """
    def helper(n):

        total, i = ________, ________

        while ________________ and ___________________:

            if _______________________:

                total += ____________________________
            else:
                total += lst[i] + 1
            
            _________________________________________
        print(total)

        return ______________________________________
    return helper


def sum_prime_digits(n):
    """
    >>> sum_prime_digits(12345)
    10 # 2 + 3 + 5
    >>> sum_prime_digits(4681029)
    2 # 2 is the only prime number
    """
    if ____________________________________________:		

        return ____________________________________	

    else:

        ___________________________________________			

        if ________________________________________:		

            return ________________________________				

        return ____________________________________
				


def midterm(n, t):
    """
    >>> midterm(500, 0) # No time left!
    0 
    >>> midterm(3, 3) # 51 + 52, questions 1 & 2
    103
    >>> midterm(3, 5) # 52 + 53, questions 2 & 3
    105 
    >>> midterm(4, 9) # 52 + 53 + 54, questions 2 & 3 & 4
    159
    """		
    if ______________________________________:		

        return ______________________________	

    else:

        return __________________________


def add_up(n, lst):
    """ 
    >>> add_up(10, [1, 2, 3, 4, 5])
    True
    >>> add_up(8, [2, 1, 5, 4, 3])
    True
    >>> add_up(-1, [1, 2, 3, 4, 5])
    False
    >>> add_up(100, [1, 2, 3, 4, 5])
    False
    """
    if __________________________________________:
    
        return True
        
    if lst == []:
    
        ____________________________________________________
        
    else:
    
        first, rest = ____________________, ____________________
        
        return __________________________________________

def duplicate_list(lst):
    """
    >>> duplicate_list([1, 2, 3])
    [1, 2, 2, 3, 3, 3]
    >>> duplicate_list([5])
    [5, 5, 5, 5, 5]
    """
    _______________________________
    
    for ____________________________:

         for ____________________________:

              __________________________________
    _______________________________

 
def count(t, value):
    pass


def even_square_tree(t):
    """
    >>> t = tree(2, [tree(1), tree(4)])
    >>> even_square_tree(t)
    tree(4, [tree(1), tree(16)])
    """
    ___________________________________________

    if ________________________________________:

        return ________________________________

    else:

        return ________________________________

def word_exists(word, t):
    if len(word) == 1:
        return _____________________________________
    elif ____________________:
        return False
    return _____(______________________________________)

def scrabble_tree(t):
    """
    We assume that all characters have a score of 1.

    >>> t1 = tree('h', [tree('j', [tree('i')])])
    >>> scrabble_tree(t1)
    'hi'
    >>> t2 = tree('i', [tree('l', [tree('l')])])
    >>> t3 = tree('h', [tree('i'), t2])
    >>> scrabble_tree(t3)
    'hill'
    """
    def find_all_words(t):
        if _______________:
            return _________________
        all_words = []
        for b in branches(t):
            words_in_branch = _____________________
            words_from_t = [___________________________________]
            filter_from_t = ___________________________________
            all_words = _______________________________________
        return _________________
    clean_words = [____________________________________________]
    return max(_______________, key=_________________________)




def Bookshelf(capacity):
        """ Creates an empty bookshelf with a certain max capacity. """
        return {'size': capacity, 'books': {}}

def add_book(bookshelf, author, title):
    """
    Adds a book to the bookshelf. If the bookshelf is full,
    print "Bookshelf is full!" and do not add the book.
    >>> books = Bookshelf(2)
    >>> add_book(books, 'Jane Austen', 'Pride and Prejudice')
    >>> add_book(books, 'Sheldon Axler', 'Linear Algebra Done Right')
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
    Returns a list of all authors who have at least one book
    in the bookshelf.
    >>> books = Bookshelf(10)
    >>> add_book(books, 'Jane Austen', 'Pride and Prejudice')
    >>> add_book(books, 'Sheldon Axler', 'Linear Algebra Done
    Right')
    >>> add_book(books, 'Kurt Vonnegut', 'Galapagos')
    >>> get_all_authors(books)
    ['Jane Austen', 'Sheldon Axler', 'Kurt Vonnegut']
    """
    return ___________________________________



def get_author_books(bookshelf, author):
    """
    Given an author name, returns a list with
    all books on the bookshelf written by that author.
    >>> books = Bookshelf(100)
    >>> add_book(books, 'Orson Scott Card', 'Ender's Game')
    >>> add_book(books, 'Orson Scott Card', 'Speaker for the
    Dead')
    >>> add_book(books, 'J.R.R. Tolkien', 'The Hobbit')
    >>> get_author_books(books, 'Orson Scott Card')
    ['Ender's Game', 'Speaker for the Dead']
    """
    return _________________________________________________


def most_popular_author(bookshelf):
    """
    Returns the author with the greatest number of books on
    this bookshelf.
    You can assume that the bookshelf is not empty.
    >>> books = Bookshelf(100)
    >>> add_book(books, 'Orson Scott Card', 'Xenocide')
    >>> add_book(books, 'Orson Scott Card', 'Children of the
    Mind')
    >>> add_book(books, 'J.R.R. Tolkien', 'The Hobbit')
    >>> most_popular_author(bookshelf)
    'Orson Scott Card'
    """
    return max(
    ________________________________________________, key=
    _______________________________________________________
    )
