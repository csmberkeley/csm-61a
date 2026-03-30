>>> a = Link(1, Link(2, Link(3)))
>>> a.first
>>> a.first = 5
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
>>> a.rest.rest.rest.rest.first


def skip(lst):
    """
    >>> a = Link(1, Link(2, Link(3, Link(4))))
    >>> a
    Link(1, Link(2, Link(3, Link(4))))
    >>> b = skip(a)
    >>> b
    Link(1, Link(3))
    >>> a
    Link(1, Link(2, Link(3, Link(4)))) # Unchanged
    """
    if ___________________________________________:

        __________________________________________

    elif _________________________________________:

        __________________________________________

    ______________________________________________
def skip(lst):
    """
    >>> a = Link(1, Link(2, Link(3, Link(4))))
    >>> skip(a)
    >>> a
    Link(1, Link(3))
    """


def shuffle(lnk):
    """Swaps each pair of items in a linked list destructively and returns the modified linked list.

    >>> shuffle(Link(1, Link(2, Link(3, Link(4)))))
    Link(2, Link(1, Link(4, Link(3))))
    >>> shuffle(Link('s', Link('c', Link(1, Link(6, Link('a'))))))
    Link('c', Link('s', Link(6, Link(1, Link('a')))))
    """
    if _________________________________________________:
        return _______________________________________________
    front = lnk.rest
    lnk.rest = _______________________________________________
    __________________________________________________________
    return ___________________________________________________


    def insert_all(s, x, index):
        """
        >>> insert = Link(3, Link(4))
        >>> original = Link(1, Link(2, Link(5)))
        >>> insert_all(original, insert, 2)
        Link(1, Link(2, Link(3, Link(4, Link(5)))))
        >>> start = Link(1)
        >>> insert_all(original, start, 0)
        Link(1, Link(1, Link(2, Link(5))))
        """
        if ___________________ and ___________________:

            ___________________________________________

        if ___________________ and ___________________:

            ___________________________________________

        _______________________________________________
    


def one(n):
    while n > 0:
       n = n // 2
def two(n):
    for i in range(n):
        for j in range(i):
            print(str(i), str(j))
def three(n):
    i = 1
    while i <= n:
        for j in range(i):
            print(j)
        i *= 2


def append_many(s, items):
    for item in items:
        append(s, item)


def prepend(s, item):
    return link(item, s)


