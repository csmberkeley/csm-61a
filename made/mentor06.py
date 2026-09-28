>>> a = [1, 2, 3]
>>> a
>>> a[2]
>>> a[-1]
>>> b = a
>>> a = a + [4, [5, 6]]
>>> a
>>> b
>>> c = a
>>> a = [4, 5]
>>> a
>>> c
>>> d = c[3:5]
>>> c[3] = 9
>>> d

>>> c[4][0] = 7
>>> d
>>> c[4] = 10
>>> d
>>> c


>>> t: tuple[int, str, float, bool, None] = (
...     3, "csm", 2.5, True, None
... )
>>> t
>>> 4, 5, 6, 7
>>> (3,)
>>> (3)
>>> ()
>>> len(())
>>> t[1:4]
>>> t[::-1]
>>> list(t)
>>> list("csm")
>>> list(())
>>> (4, 5) + (6, 7)
>>> (3,) * 3
>>> (3) * 3
>>> t[0] = 4
>>> locations = {(4, 5): "CSM"}
>>> locations[(4, 5)]
>>> locations[[4, 5]] = "office hours"
>>> locations[(4, [5])] = "office hours"


    def duplicate_list(lst: list[int]) -> list[int]:
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



def all_primes(nums):


def gen_list(n):
    """
    Returns a nested list structure of n elements where the
    ith element is a list from 0 (inclusive) to i (exclusive).
    >>> gen_list(3)
    [[0], [0, 1], [0, 1, 2]]
    >>> gen_list(5)
    [[0], [0, 1], [0, 1, 2], [0, 1, 2, 3], [0, 1, 2, 3, 4]]
    """
    return _______________________________________________
def gen_increasing(n):
    """
    Returns a nested list structure of n elements where the
    ith element of each list is one more than the previous
    element (even if the previous is in a prior sublist).
    >>> gen_increasing(3)
    [[0], [1, 2], [3, 4, 5]]
    >>> gen_increasing(5)
    [[0], [1, 2], [3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13,
    14]]
    """
    return ______________________________________________


    def count_t(d: dict[str, int], word: str) -> None:
        """
        >>> words = {}
        >>> count_t(words, "tatter")
        >>> words["tatter"]
        3
        >>> count_t(words, "tree")
        >>> words
        {'tatter': 3, 'tree': 1}
        """
        _______________________________

        for ____________________________:

            if ____________________________:

                __________________________________

        _______________________________



def snapshot(f, snap_inputs):
    """
    >>> snapshot(lambda x: x**2, [1, 2, 3])
    {1: 1, 2: 4, 3: 9}
    """

    snap = __________________________________________

    __________________________________________:

        __________________________________________

    return snap




class Foo(object):
    x = 'bam'

    def __init__(self, x):
        self.x = x

    def baz(self):
        return type(self).x + self.x

class Bar(Foo):
    x = 'boom'

    def __init__(self, x):
        Foo.__init__(self, 'er' + x)

foo = Foo('boo')
>>> bar = Bar('ang')
>>> Bar.x


>>> a = Link(1, Link(2, Link(3)))
>>> a.first
>>> a.first = 5
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
>>> a.rest.rest.rest.rest.first
>>> repr(Link(1, Link(2, Link(3, Link.empty))))
>>> Link(1, Link(2, Link(3, Link.empty)))
>>> str(Link(1, Link(2, Link(3))))
>>> print(Link(Link(1), Link(2, Link(3))))


def linkify_rec(lst):
    """
    >>> lst = [0, 1, 2, 3]
    >>> linkify_rec(lst)
    Link(0, Link(1, Link(2, Link(3))))
    """
    if ___________________________________:

        __________________________________

    else:

        __________________________________


def linkify_iter(lst):

    ______________________________________

    for __________________________________:

        __________________________________

    ______________________________________



def combine_two(lnk, fn):
    """
    >>> lnk1 = Link(1, Link(2, Link(3, Link(4))))
    >>> combine_two(lnk1, add)
    Link(3, Link(7))
    >>> lnk2 = Link(2, Link(4, Link(6)))
    >>> combine_two(lnk2, mul)
    Link(8, Link(6))
    """
    if ______________________________________:

        return ______________________________

    elif ____________________________________

        return ______________________________

    combined = ______________________________

    return __________________________________


def donut(d, f):
    """
    >>> donut(12, 1)
    1
    >>> donut(12, 2)
    13
    >>> donut(12, 12)
    1352078
    >>> donut(0, 0)
    1
    """
    if __________________:

        return __________________

    if __________________:

        return __________________

    return ______________________________________


