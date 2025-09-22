def num_digits(n):
    """Takes in an positive integer and returns the number of
    digits.

    >>> num_digits(0)
    1
    >>> num_digits(1)
    1
    >>> num_digits(7)
    1
    >>> num_digits(1093)
    4
    """


def bar(f, x):
    if x == 1:
        return f(x)
    else:
        return f(x) + bar(f, x - 1)

f = 4
bar(lambda x: x + f, 2)


def collapse(n):
    """
    >>> collapse(9)
    9
    >>> collapse(12)
    12
    >>> collapse(22)
    2
    >>> collapse(12234441)
    12341
    >>> collapse(11200000013333)
    12013
    """
    rest, last = n // 10, n % 10

    if ___________________________________:

        ____________________________________

    elif _________________________________:

        ____________________________________
    else:

        ____________________________________


def gib(n):
    """
    >>> gib(0)
    0
    >>> gib(1)
    1
    >>> gib(2)
    2
    >>> gib(3) # gib(2) + gib(1) + gib(0) = 3
    3
    >>> gib(4) # gib(3) + gib(2) + gib(1) = 6
    6
    """
    if ______________________________:

        return ______________________________
        
    return ______________________________


def donut(d, f):
    """
    >>> donut(12, 1)
    1
    >>> donut(12, 2)
    13
    >>> donut(12, 12)
    1352078
    >>> donut(0, 0)
    1
    """
    if __________________:

        return __________________

    if __________________:

        return __________________

    return ______________________________________


def midterm(n, t):
    """
    >>> midterm(500, 0) # No time left!
    0 
    >>> midterm(3, 3) # 51 + 52, questions 1 & 2
    103
    >>> midterm(3, 5) # 52 + 53, questions 2 & 3
    105 
    >>> midterm(4, 9) # 52 + 53 + 54, questions 2 & 3 & 4
    159
    """		
    if ______________________________________:		

        return ______________________________	

    else:

        return __________________________


