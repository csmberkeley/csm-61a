>>> a = [1, 2]
>>> a.append([3, 4])
>>> a
>>> b = list(a)
>>> a[0] = 5
>>> a[2][0] = 6
>>> b
>>> a.extend([7])
>>> a += [8]
>>> a += 9
>>> a
>>> b[2][1] = a[2:]
>>> a[2][1][0][0]


def jerry(jerry):
    def jerome(alex):
        alex.append(jerry[1:])
        return alex
    return jerome
			
ben = ['nice', ['ice']]
jerome = jerry(ben)
alex = jerome(['cream'])
ben[1].append(alex)
ben[1][1][1] = ben
print(ben)


def insert_n(lst, x, n):
    """
    >>> lst = []
    >>> insert_n(lst, 4, 1)
    >>> insert_n(lst, 1, 3)
    >>> insert_n(lst, 2, 2)
    >>> lst
    [1, 1, 1, 2, 2, 4]
    >>> insert_n(lst, 1, -2)
    >>> lst
    [1, 2, 2, 4]
    """
    if n > 0:
        i = 0
        while ______________________________________:

            ______________________________________

        ______________________________________:

            ______________________________________
    elif n < 0:

        ______________________________________

            ______________________________________


def foo():
    a = 0
    if a == 0:
        print("Hello")
        yield a
        print("World")

>>> foo()
>>> foo_gen = foo()
>>> next(foo_gen)
>>> next(foo_gen)
>>> for i in foo():
...   print(i)
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
>>> reduce(lambda x, y: x + y, a)


def accumulate(it):
    """
    >>> def all_ints():
    ...     i = 0
    ...     while True:
    ...         yield i
    ...         i += 1
    >>> a = accumulate(all_ints())
    >>> [next(a) for x in range(6)]
    [0, 1, 3, 6, 10, 15]
    """


def in_order(t):
    """
    >>> t = tree(0, [tree(1), tree(2, [tree(3), tree(4)])])
    >>> list(in_order(t))
    [1, 0, 3, 2, 4]
    """


def all_sums(lst):
    """
    >>> list(all_sums([]))
    [0] 
    >>> list(all_sums([1, 2]))
    [3, 2, 1, 0]
    >>> list(all_sums([1, 2, 3]))
    [6, 5, 4, 3, 3, 2, 1, 0]
    >>> list(all_sums([1, 2, 7]))
    [10, 9, 8, 7, 3, 2, 1, 0]
    """


