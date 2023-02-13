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


def fizzbuzz(n):
    """Prints the numbers from 1 to n. If the number is divisible by 3, it
    instead prints 'fizz'. If the number is divisible by 5, it instead prints
    'buzz'. If the number is divisible by both, it prints 'fizzbuzz'.

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


def selective_sum(n, cond):
    """
    >>> is_odd = lambda x: x % 2 == 1
    >>> selective_sum(5, is_odd) # 5 + 3 + 1 = 9
    9
    >>> bigger_than_10 = lambda x: x > 10
    >>> selective_sum(13, bigger_than_10) # 13 + 12 + 11 = 36
    36
    >>> selective_sum(-1, is_odd) # no positive integers <= 1
    0
    """
    if _______________________________________________:

        return _______________________________________________

    if _______________________________________________:

        return _______________________________________________

    return _______________________________________________


    def fit_sections(total, n, m):
        """
        >>> fit_sections(1, 3, 5)
        False
        >>> fit_sections(5, 3, 5) # 0 * 3 + 1 * 5 = 5
        True
        >>> fit_sections(11, 3, 5) # 2 * 3 + 1 * 5 = 11
        True
        >>> fit_sections(61, 11, 15) # can't express 61 as a * 11 + b * 15
        False
        """
        if _______________________________________________:
    
            return True
    
        elif __________________________________________________:
    
            return False
    
        return ___________________________________________
    


def mario_number(level):
    """
    >>> mario_number(10101)
    1
    >>> mario_number(11101)
    2
    >>> mario_number(100101)
    0
    """
    if _______________________:

        ______________________

    elif _____________________:

        ______________________

    else:

        ___________________________________________________


def collapse(n):
    """
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


