def a(y):
    d = 1
    b = lambda x: y(x)
    e = lambda x: x(3)
    return e(b)
d = 5
a(lambda x: 4 - x + d)




>>> make_interval = _____________________________________
>>> in_interval = make_interval(-1, 2)
>>> in_interval(0)
True
>>> in_interval(61)
False



def boba_line(n):
    """Takes in an integer of 0s and 1s and returns the number of 1s.

    >>> boba_line(0)
    0
    >>> boba_line(1)
    1
    >>> boba_line(10101)
    3
    >>> boba_line(10001)
    2
    """
    if __________________ :             # base case

        return _________________

    else:

        return ________________  +  ____________________   # recursive case



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


def fizzbuzz(n):
    """Prints the numbers from 1 to n. If the number is divisible by 3, it
    instead prints 'fizz'. If the number is divisible by 5, it instead prints
    'buzz'. If the number is divisible by both, it prints 'fizzbuzz'. You must do this recursively!

    >>> fizzbuzz(15)
    1
    2
    fizz
    4
    buzz
    fizz
    7
    8
    fizz
    buzz
    11
    fizz
    13
    14
    fizzbuzz
    """


