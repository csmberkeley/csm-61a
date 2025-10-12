    for i in range(2, n):
        if n % i == 0:
            return tree(n, [factor_tree(i), factor_tree(n // i)])
    return tree(n)


def even_square_tree(t):
    branches_s = [even_square_tree(b) for b in branches(t)]
    if label(t) % 2 == 0:
        return tree(label(t) * label(t), branches_s)
    else:
        return tree(label(t), branches_s)


pom = [16, 15, 13]
pompom = pom * 2
pompom.append(pom[:])
pom.extend(pompom)


def accumulate(lst):
    sum_so_far = 0
    for i in range(len(lst)):
        item = lst[i]
        if isinstance(item, list):
            inside = accumulate(item)
            sum_so_far += inside
        else:
            sum_so_far += item
            lst[i] = sum_so_far
    return sum_so_far


>>> a = [1, 2, 3]
>>> x = iter(a)
N/A
>>> next(x)
1
>>> next(x)
2
>>> y = iter(a)
>>> next(y)
1
>>> next(x)
3
>>> next(x)
StopIteration Error
>>> z = iter(y) 
>>> next(z)
2
>>> [next(y), next(y), next(z)]
[2, 3, 3]
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
-1
>>> reduce(lambda x, y: x + y, a)
16


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
    t1, t2 = next(iter1), next(iter2)
    while True:
        if t1 > t2:
            yield t2
            t2 = next(iter2)
        else:
            yield t1
            t1 = next(iter1)


