tree(4,
    [tree(5, []),
     tree(2,
        [tree(2, []),
         tree(1, [])]),
     tree(1, []),
     tree(8,
        [tree(4, [])])])








def replace_x(t, x):
    """
    >>> t = tree(2, [tree(1), tree(2)])
    >>> replace_x(t, 2)
    tree(0, [tree(1), tree(0)])
    """
    new_branches = []
    for _______ in ____________________________:

        new_branches._____________________________

    if ________________________________________:

        return ________________________________

    return ________________________________


def contains_n(elem, n, t):
    """
    >>> t1 = tree(1, [tree(1, [tree(2)])])
    >>> contains_n(1, 2, t1)
    True
    >>> contains_n(2, 2, t1)
    False
    >>> contains_n(2, 1, t1)
    True
    >>> t2 = tree(1, [tree(2), tree(1, [tree(1), tree(2)])])
    >>> contains_n(1, 3, t2)
    True
    >>> contains_n(2, 2, t2) # Not on a path
    False
    """
    if n == 0:

        return True

    elif ___________________________________________:

        return _____________________________________

    elif label(t) == elem:

        return _____________________________________

    else:

        return _____________________________________


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


def accumulate(lst):
    """
    >>> l = [1, 5, 13, 4]
    >>> accumulate(l)
    23
    >>> l
    [1, 6, 19, 23]
    >>> deep_l = [3, 7, [2, 5, 6], 9]
    >>> accumulate(deep_l)
    32
    >>> deep_l
    [3, 10, [2, 7, 13], 32]
    """
    sum_so_far = 0
    for ________________________________________:

	    ________________________________________

        if isinstance(___________________, list):

	    inside = ___________________________

            ____________________________________

        else:
            ____________________________________

            ____________________________________
    
    _________________________________


def scrabbler(chars, words, values):
    """ Given a list of words and point values for letters, returns a
    dictionary mapping each word that can be formed from letters in chars
    to their point value. You may not need all lines
    >>> words = ["easy", "as", "pie"]
    >>> values = {"e": 2, "a": 2, "s": 1, "p": 3, "i": 2, "y": 4}
    >>> scrabbler("heuaiosby", words, values)
    {'easy': 9, 'as': 3}
    >>> scrabbler("piayse", words, values)
    {'pie': 7, 'as': 3}
    """
    result = ____________________________________

    for ___________________________________________:

        if ________________________________________:

            ____________________________________

            ____________________________________
    
    return result


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


