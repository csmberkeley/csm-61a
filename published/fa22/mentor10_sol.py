def tree_sum(t):
    """
    >>> t = Tree(1, [Tree(2, [Tree(3)]), Tree(4)])
    >>> tree_sum(t)
    10
    >>> t.label
    10
    >>> t.branches[0].label
    5
    >>> t.branches[1].label
    4
    """
    for b in t.branches:
        t.label += tree_sum(b)
    return t.label


    def helper(t, seen_so_far):
        if t.label in seen_so_far:
          t.label = -1
        else:
            seen_so_far = seen_so_far + [t.label]
        for b in t.branches:
            helper(b, seen_so_far)
    helper(t, [])


def replace_leaves_sum(t):
    def helper(t, total):
        if t.is_leaf():
            t.label = total + t.label
        else:
            for b in t.branches:
                helper(b, total + t.label)
    helper(t, 0)


    if n == 0:
        return True
    elif t.is_leaf():
        return n == 1 and t.label == elem
    elif t.label == elem:
        return any([contains_n(elem, n - 1, b) for b in     
          t.branches])
    else:
        return any([contains_n(elem, n, b) for b in 
          t.branches])


def foo(n):
    for i in range(n):
        print('hello')


def belgian_waffle(n):
    total = 0
    while n > 0:
        total += 1
        n = n // 2
    return total


def make_digit_remover(i):
    def remove(n):
        removed = n
        while removed > 0:
            digit = removed % 10
            removed = removed // 10
            if digit == i:
                return removed
        return n
    return remove


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
    if n == 0:
        return True
    if lst == []:
         return False  
    else:
        first, rest = lst[0], lst[1:]
        return add_up(n - first, rest) or add_up(n, rest)



>>> violet = [7, 77, 17]
>>> violet.append([violet.pop(1)])

>>> dash = violet * 2
>>> jack = dash[3:5]
>>> jackjack = jack.extend(jack)

>>> helen = list(violet)
>>> helen += [jackjack]
>>> helen[2].append(violet)


    if n == 0:
        return [[]]
    if len(lst) == n:
        return [lst]
    with_first = [[lst[0]] + x for x in subsets(lst[1:], n - 1)]
    without_first = subsets(lst[1:], n)
    return with_first + without_first


def num_elems(lst):
    count = 0
    for elem in lst:
        if isinstance(elem, list):
            for c in num_elems(elem):
                yield c
            count += c
        else:
            count += 1
    yield count


1 2 3 4 5 6 [7] 6 5 4 3 2 1 [0] 1 2 [3] 2 1 0 [-1] 0 1 2 3 4
[5] [4] 5 6
>>> tracker1 = PingPongTracker()
>>> tracker2 = PingPongTracker()
>>> tracker1.next()
1
>>> tracker1.next()
2
>>> tracker2.next()
1

class PingPongTracker:
    def __init__(self):






    def next(self):
class PingPongTracker:
    def __init__(self):
        self.current = 0
        self.index = 1
        self.add = True

    def next(self):
        if self.add:
            self.current += 1
        else:
            self.current -= 1
        if has_seven(self.index) or self.index % 7 == 0:
            self.add = not self.add
        self.index += 1
        return self.current



def combine_two(lnk, fn):
    if lnk is Link.empty:
        return Link.empty
    elif lnk.rest is Link.empty:
        return Link(lnk.first)
    combined = fn(lnk.first, lnk.rest.first)
    return Link(combined, combine_two(lnk.rest.rest, fn))


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


