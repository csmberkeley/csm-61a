>>> a = Link(1, Link(2, Link(3)))
+---+---+  +---+---+  +---+---+
| 1 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
1
>>> a.first = 5
+---+---+  +---+---+  +---+---+
| 5 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
   +---+---+  +---+---+  +---+---+
+->| 5 | --|->| 2 | --|->| 3 | --|--+
|  +---+---+  +---+---+  +---+---+  |
|                                   |
+-----------------------------------+
>>> a.rest.rest.rest.rest.first
2


    if lst is Link.empty:
    	return Link.empty
     elif lst.rest is Link.empty:
        return Link(lst.first)
    return Link(lst.first, skip(lst.rest.rest))
def skip(lst):
    """
    >>> a = Link(1, Link(2, Link(3, Link(4))))
    >>> skip(a)
    >>> a
    Link(1, Link(3))
    """
def skip(lst): # Recursively
    if lst is Link.empty or lst.rest is Link.empty:
        return
    lst.rest = lst.rest.rest
    skip(lst.rest)

def skip(lst): # Iteratively
    while lst is not Link.empty and lst.rest is not Link.empty:
        lst.rest = lst.rest.rest
        lst = lst.rest
1 -> 2 -> 3 -> 4 -> 5
1 -> 3 -> 4 -> 5


def shuffle(lnk):
    """Swaps each pair of items in a linked list destructively and returns the modified linked list.

    >>> shuffle(Link(1, Link(2, Link(3, Link(4)))))
    Link(2, Link(1, Link(4, Link(3))))
    >>> shuffle(Link('s', Link('c', Link(1, Link(6, Link('a'))))))
    Link('c', Link('s', Link(6, Link(1, Link('a')))))
    """
    if lnk is Link.empty or lnk.rest is Link.empty:
        return lnk
    front = lnk.rest
    lnk.rest = shuffle(front.rest)
    front.rest = lnk
    return front


    def insert_all(s, x, index):
        """
        >>> insert = Link(3, Link(4))
        >>> original = Link(1, Link(2, Link(5)))
        >>> insert_all(original, insert, 2)
        Link(1, Link(2, Link(3, Link(4, Link(5)))))
        >>> start = Link(1)
        >>> insert_all(original, start, 0)
        Link(1, Link(1, Link(2, Link(5))))
        >>> insert_all(original, insert, 3)
        Link(1, Link(2, Link(5, Link(3, Link(4)))))
        """
        if s is Link.empty and x is Link.empty:
            return Link.empty
        if x is not Link.empty and index == 0:
            return Link(x.first, insert_all(s, x.rest, 0))
        return Link(s.first, insert_all(s.rest, x, index - 1))


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


