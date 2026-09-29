>>> a = [1, 2, 3]
>>> a
>>> a[2]
>>> a[-1]
>>> a[1:]
>>> a[:2]
>>> a + [4, 5]
>>> a
>>> nested = [1, 2, 3, 4, [5, 6]]
>>> nested[4]
>>> nested[4][0]
>>> nested[3:5]


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
>>> locations = {(4, 5): "CSM"}
>>> locations[(4, 5)]
>>> locations[[4, 5]]
>>> locations[(4, [5])]


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



def all_primes(nums: list[int]) -> list[int]:


def gen_list(n: int) -> list[list[int]]:
    """
    Returns a nested list structure of n elements where the
    ith element is a list from 0 (inclusive) to i (exclusive).
    >>> gen_list(3)
    [[0], [0, 1], [0, 1, 2]]
    >>> gen_list(5)
    [[0], [0, 1], [0, 1, 2], [0, 1, 2, 3], [0, 1, 2, 3, 4]]
    """
    return _______________________________________________
def gen_increasing(n: int) -> list[list[int]]:
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


def count_t(word: str) -> int:
    """
    >>> count_t("tatter")
    3
    >>> count_t("tree")
    1
    >>> count_t("")
    0
    """
    _______________________________

    for ____________________________:

        if ____________________________:

            __________________________________

    _______________________________
words = ["tatter", "tree"]
counts: dict[str, int] = {
    ____________: ____________ for word in words
}


from collections.abc import Callable

def snapshot(
    f: Callable[[int], int], snap_inputs: list[int]
) -> dict[int, int]:
    """
    >>> snapshot(lambda x: x**2, [1, 2, 3])
    {1: 1, 2: 4, 3: 9}
    >>> snapshot(lambda x: x + 1, [])
    {}
    """
    return {
        ____________: ____________
        for _______________________________
    }




from dataclasses import dataclass

@dataclass
class Session:
    topic: str
    room: int
    minutes: int = 60

morning = Session("Recursion", 310)
afternoon = Session("Sequences", 205, 45)
>>> morning.topic
>>> morning.minutes
>>> afternoon.room
>>> afternoon.minutes
>>> morning.minutes + afternoon.minutes
>>> morning
>>> Session(room=220, topic="Linked lists").topic


>>> a = Link(1, Link(2, Link(3)))
>>> a.first
>>> a.rest.first
>>> a.rest.rest.first
>>> a.rest.rest.rest
>>> isinstance(a.rest, Link)
>>> isinstance(a.rest.rest.rest, Link)
>>> a.rest.rest.rest.first
>>> a.rest.rest
>>> Link(1, Link(2))
>>> print(a)


def linkify_rec[T](lst: list[T]) -> LinkedList[T]:
    """
    >>> lst = [0, 1, 2, 3]
    >>> print(linkify_rec(lst))
    (0 1 2 3)
    >>> linkify_rec([])
    ()
    """
    if ___________________________________:

        __________________________________

    else:

        __________________________________


def linkify_iter[T](lst: list[T]) -> LinkedList[T]:

    ______________________________________

    for __________________________________:

        __________________________________

    ______________________________________



from collections.abc import Callable
def combine_two(
    lnk: LinkedList[int], fn: Callable[[int, int], int]
) -> LinkedList[int]:
    """
    >>> from operator import add, mul
    >>> lnk1 = Link(1, Link(2, Link(3, Link(4))))
    >>> print(combine_two(lnk1, add))
    (3 7)
    >>> lnk2 = Link(2, Link(4, Link(6)))
    >>> print(combine_two(lnk2, mul))
    (8 6)
    >>> combine_two((), add)
    ()
    """
    if ______________________________________:

        return ______________________________
    elif ____________________________________:

        return ______________________________
    combined = ______________________________

    return __________________________________


def donut(d: int, f: int) -> int:
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


