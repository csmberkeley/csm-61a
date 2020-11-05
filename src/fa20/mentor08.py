def among(green):
    def us(yellow):
        _______________________
        yellow += ___________
        green += ____________
        _____________________
        return ______________
    return ______________
vote = among('Red')('Blue')()


1 2 3 4 5 6 [7] 6 5 4 3 2 1 [0] 1 2 [3] 2 1 0
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
        ___________________________
        if add:
            ________________________
        else:
            ________________________
        if _______________________:
            add = not add
        __________________________
        __________________________
    return _______________________


def foo():
    a = 0
    if a == 0:
        print("Hello")
        yield a
        print("World")

>>> foo()


def filter_gen(s, f):
    """
    >>> list(filter_gen([1, 2, 3, 4, 5],
                                lambda x: x % 2 == 0))
    [2, 4]
    >>> list(filter_gen((1, 2, 3, 4, 5), lambda x: x < 3))
    [1, 2]
    """


def tree_sequence(t):
    """
    >>> t = tree(1, [tree(2, [tree(5)]), tree(3, [tree(4)])])
    >>> print(list(tree_sequence(t)))
    [1, 2, 5, 3, 4]
    """


