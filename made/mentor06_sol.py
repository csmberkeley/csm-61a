    >>> a = [1, 2, 3]
    >>> a
    [1, 2, 3]
    >>> a[2]
    3
    >>> a[:2]
    [1, 2]
    >>> len(a)
    3
    >>> c = [x * 2 for x in a]
    >>> c
    [1, 4, 6]
    >>> sum(c)
    >>> max(c)
    >>> all(c)
    >>> all([0, 1, 2, 3])
    11
    6
    True
    False
    >>> b = [1, 2, 3, a, 4]
    >>> b
    [1, 2, 3, [1, 2, 3], 4]
    >>> b[3][2]
    3


[x ** 2 for x in lst]
sum([x for x in lst if x % 2 == 0])
a = [[x for x in range(y)] for y in range(1, 6)]
b = [[x for x in range(y) if x != 2] for y in range(1, 6)]


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


    >>> a = "hello world!"
    >>> a[4]
    'o'
    >>> a = "hello world!"
    >>> a[6:11]
    'world'
    >>> len(a)
    12
    >>> 'lo' in a
    True


    >>> a = {1: "one", 2: "two", 3: "three"}
    >>> a[2]
    "two"
    >>> b = {"five": 5, "six": [1,2,3], "seven": 7}
    >>> b["five"]
    5
    >>> b["six"][2]
    3


def apply_to_even(f, d):
    return {i: f(d[i]) for i in d if i % 2 == 0}


