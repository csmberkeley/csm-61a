def factor_tree(n):
    for i in ______________________:
        if ________________________:
            return tree(_____, _____________________________)
    _______________________________


def even_square_tree(t):
    '''
    >>> t = tree(2, [tree(1), tree(4)])
    >>> even_square_tree(t)
    tree(4, [tree(1), tree(16)])
    '''
    ___________________________________________

    if ________________________________________:

        return ________________________________

    else:

        return ________________________________



pom = [16, 15, 13]
pompom = pom * 2
pompom.append(pom[:])
pom.extend(pompom)


def accumulate(lst):
    '''
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
    '''
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


>>> a = [1, 2, 3]
>>> x = iter(a)
>>> next(x)
>>> next(x)
>>> y = iter(a)
>>> next(y)
>>> next(x)
>>> next(x)
>>> z = iter(y) 
>>> next(z)
>>> [next(y), next(y), next(z)]
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
>>> reduce(lambda x, y: x + y, a)


def interleave(iter1, iter2):
    '''
    >>> gen = interleave(iter([1, 3, 5, 7, 9]),
                         iter([2, 4, 6, 8, 10]))
    >>> for elem in gen:
    ...     print(elem)
    1
    2
    3
    4
    5
    6
    7
    8
    9
    '''


