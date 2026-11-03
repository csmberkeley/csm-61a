>>> a = Link(8)
>>> b = Link(6, a)
>>> print(b)
(6 8)
>>> c = Link(2, b)
>>> print(c)
(2 6 8)
>>> print(b)
(6 8)
>>> c.rest == b
True
>>> Link(c, b).first.first
2
>>> len(c)
TypeError: object of type 'Link' has no len()
Link(1, Link(2, Link(3)))


def append[T](a: LinkedList[T], b: LinkedList[T]) -> LinkedList[T]:
    if not isinstance(a, Link):
        return b
    return Link(a.first, append(a.rest, b))

def reverse[T](lnk: LinkedList[T]) -> LinkedList[T]:
    if not isinstance(lnk, Link):
        return ()
    return append(reverse(lnk.rest), Link(lnk.first))


def keep_if(
    lnk: LinkedList[int], pred: Callable[[int], bool]
) -> LinkedList[int]:
    if not isinstance(lnk, Link):
        return ()
    rest = keep_if(lnk.rest, pred)
    if pred(lnk.first):
        return Link(lnk.first, rest)
    return rest


def merge(a: LinkedList[int], b: LinkedList[int]) -> LinkedList[int]:
    if not isinstance(a, Link):
        return b
    elif not isinstance(b, Link):
        return a
    elif a.first <= b.first:
        return Link(a.first, merge(a.rest, b))
    else:
        return Link(b.first, merge(a, b.rest))


>>> t = Tree(5, [Tree(3, [Tree(8)]), Tree(1), Tree(7)])
>>> t.label
2
>>> t.branches[0].label
3
>>> is_leaf(t.branches[1])
True
>>> len(t.branches)
3
>>> t.branches[1].branches[0]
IndexError: list index out of range
>>> t.branches[0].branches
[Tree(label=8, branches=[])]
>>> u = Tree(2, [t.branches[0]])
>>> u.branches[0].branches[0].label
8
>>> print(u)
2
  3
    8


def tree_height(t: Tree[int]) -> int:
    if is_leaf(t):
        return 0
    return 1 + max([tree_height(b) for b in t.branches])


def link_to_tree[T](lnk: Link[T]) -> Tree[T]:
    if not isinstance(lnk.rest, Link):
        return Tree(lnk.first)
    return Tree(lnk.first, [link_to_tree(lnk.rest)])

def tree_to_link[T](t: Tree[T]) -> Link[T]:
    if is_leaf(t):
        return Link(t.label)
    return Link(t.label, tree_to_link(t.branches[0]))


def all_paths[T](t: Tree[T]) -> list[LinkedList[T]]:
    if is_leaf(t):
        return [Link(t.label)]
    return [Link(t.label, p) for b in t.branches for p in all_paths(b)]


def count_paths(t: Tree[int], total: int) -> int:
    if is_leaf(t):
        return 1 if t.label == total else 0
    return sum([count_paths(b, total - t.label) for b in t.branches])


