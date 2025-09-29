    >>> x = 'CS61A '
    >>> y = 'CS Mentors'
    >>> x + y
    'CS 61A CS Mentors'
    >>> colors = ['red', 'yellow', 'green']
    >>> 'green' in colors
    >>> 'GREEN' in colors
    False
    >>> luggage = [c + ' suitcase' for c in colors]
    >>> luggage
    ['red suitcase', 'yellow suitcase', 'green suitcase']


    >>> a = [1, 2, 3]
    >>> a
    [1, 2, 3]
    >>> a[2]
    >>> a[:2]
    [1, 2]
    >>> b = [1, 2, 3, a, 4]
    >>> b
    [1, 2, 3, [1, 2, 3], 4]
    >>> b[3][2]
    3


[x ** 2 for x in lst]
sum([x for x lst1 if x % 2 == 0])
a = [[x for x in range(y)] for y in range(1, 6)]
b = [[x for x in range(y) if x != 2] for y in range(1, 6)]


def apply_to_even(f, d):
    return {i: f(d[i]) for i in d if i % 2 == 0}


def all_true(lst):
    '''
    >>> all_true([True, 1, 'True'])
    True
    >>> all_true([1, 0, 1])
    False
    >>> all_true([])
    True
    '''
    if not lst:
        return True
    elif not lst[0]:
        return False
    else:
        return all_true(lst[1:])
    The built-in Python function all does the same thing that all_true does!


def max_subset_sum(lst, n):
    if n == 0:
        return 0
    elif len(lst) <= n:
        return sum(lst)
    with_elem = max_subset_sum(lst[1:], n - 1) + lst[0]
    without_elem = max_subset_sum(lst[1:], n)
    return max(with_elem, without_elem)


