>>> a = Link(8)
>>> b = Link(6, a)
>>> print(b)
>>> c = Link(2, b)
>>> print(c)
>>> print(b)
>>> c.rest == b
>>> Link(c, b).first.first
>>> len(c)


def append[T](a: LinkedList[T], b: LinkedList[T]) -> LinkedList[T]:
    """
    >>> print(append(Link(1, Link(2)), Link(7, Link(8))))
    (1 2 7 8)
    >>> print(append((), Link(5)))
    (5)
    >>> print(append(Link(1), ()))
    (1)
    >>> append((), ())
    ()
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________


def reverse[T](lnk: LinkedList[T]) -> LinkedList[T]:
    """
    >>> print(reverse(Link(1, Link(2, Link(3)))))
    (3 2 1)
    >>> reverse(())
    ()
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________


from collections.abc import Callable
def keep_if(
    lnk: LinkedList[int], pred: Callable[[int], bool]
) -> LinkedList[int]:
    """
    >>> lnk = Link(1, Link(2, Link(3, Link(4))))
    >>> print(keep_if(lnk, lambda x: x % 2 == 0))
    (2 4)
    >>> print(keep_if(lnk, lambda x: x > 0))
    (1 2 3 4)
    >>> keep_if(lnk, lambda x: x > 10)
    ()
    """
    if ______________________________________:

        return ______________________________

    rest = ____________________________________

    if ______________________________________:

        return ______________________________

    return ____________________________________


def merge(a: LinkedList[int], b: LinkedList[int]) -> LinkedList[int]:
    """
    >>> a = Link(1, Link(5))
    >>> b = Link(2, Link(3, Link(8)))
    >>> print(merge(a, b))
    (1 2 3 5 8)
    >>> print(merge(a, ()))
    (1 5)
    >>> print(merge(Link(1, Link(3)), Link(1)))
    (1 1 3)
    >>> merge((), ())
    ()
    """
    if ______________________________________:

        return ______________________________

    elif ____________________________________:

        return ______________________________

    elif ____________________________________:

        return ______________________________

    else:

        return ______________________________


>>> t = Tree(5, [Tree(3, [Tree(8)]), Tree(1), Tree(7)])
>>> t.label
>>> t.branches[0].label
>>> is_leaf(t.branches[1])
>>> len(t.branches)
>>> t.branches[1].branches[0]
>>> t.branches[0].branches
>>> u = Tree(2, [t.branches[0]])
>>> u.branches[0].branches[0].label
>>> print(u)


def tree_height(t: Tree[int]) -> int:
    """
    >>> tree_height(Tree(1))
    0
    >>> t = Tree(1, [Tree(4), Tree(2, [Tree(3)])])
    >>> tree_height(t)
    2
    """
    if ______________________________________:

        return ______________________________

    return 1 + ________________________________________________________


def link_to_tree[T](lnk: Link[T]) -> Tree[T]:
    """
    >>> print(link_to_tree(Link(6, Link(2, Link(9)))))
    6
      2
        9
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________


def tree_to_link[T](t: Tree[T]) -> Link[T]:
    """Assume every node of t has at most one branch.
    >>> print(tree_to_link(Tree(6, [Tree(2, [Tree(9)])])))
    (6 2 9)
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________


def all_paths[T](t: Tree[T]) -> list[LinkedList[T]]:
    """
    >>> t = Tree(1, [Tree(2), Tree(3, [Tree(4), Tree(5)])])
    >>> for p in all_paths(t):
    ...     print(p)
    (1 2)
    (1 3 4)
    (1 3 5)
    >>> all_paths(Tree(7))
    [Link(first=7, rest=())]
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________________


def count_paths(t: Tree[int], total: int) -> int:
    """
    >>> t = Tree(1, [Tree(3),
    ...              Tree(3, [Tree(4),
    ...                       Tree(0)]),
    ...              Tree(4, [Tree(1)])
    ...             ]
    ...     )
    >>> count_paths(t, 4)
    2
    >>> count_paths(t, 8)
    1
    >>> count_paths(t, 6)
    1
    >>> count_paths(t, 5)
    0
    """
    if ______________________________________:

        return ______________________________

    return ____________________________________________________________


