def among(green):
    def us(yellow):
        nonlocal green
        yellow += green
        green += yellow
        return lambda : 'Pink'
    return us
vote = among('Red')('Blue')()


def has_seven(k): # Use this function for your answer below
    if k % 10 == 7:
        return True
    elif k < 10:
        return False
    else:
        return has_seven(k // 10)

def make_pingpong_tracker():
    """ Returns a function that returns the next value in the
    pingpong sequence each time it is called.
    >>> output = []
    >>> x = make_pingpong_tracker()
    >>> for _ in range(9):
    ... output += [x()]
    >>> output
    [1, 2, 3, 4, 5, 6, 7, 6, 5]
    """
    index, current, add = 1, 0, True
    def pingpong_tracker():
        nonlocal index, current, add
        if add:
            current = current + 1
        else:
            current = current - 1
        if has_seven(index) or index % 7 == 0:
            add = not add
        index += 1
        return current
    return pingpong_tracker


def foo():
    a = 0
    while a < 10:
        a += 1
        yield a


def filter_gen(s, f):
    """
    >>> list(filter_gen([1, 2, 3, 4, 5],
                                lambda x: x % 2 == 0))
    [2, 4]
    >>> list(filter_gen((1, 2, 3, 4, 5), lambda x: x < 3))
    [1, 2]
    """
    for x in s:
        if f(x):
            yield x


def tree_sequence(t):
    yield label(t)
    for branch in branches(t):
        for value in tree_sequence(branch):
            yield value
"""
Alternative Solution:
def tree_sequence(t):
    yield label(t)
    for branch in branches(t):
        yield from tree_sequence(branch)
"""
