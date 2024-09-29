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


def sum_prime_digits(n):
    """
    >>> sum_prime_digits(12345)
    10 # 2 + 3 + 5
    >>> sum_prime_digits(4681029)
    2 # 2 is the only prime number
    """
    if ____________________________________________:		

        return ____________________________________	

    if ________________________________________:		

        return ________________________________				

    return ____________________________________
				


def near(n, smallest=10, d=10):
    """
    >>> near(123)
    123
    >>> near(153)
    153
    >>> near(1523)
    153
    >>> near(15123)
    153
    >>> near(985357)
    537
    >>> near(11111111)
    1
    >>> near(14735476)
    143576
    >>> near(14735476)
    1234567
    """
    if n == 0:

        return ____________________________________

    no = near(n//10, smallest, d)

    if (smallest > _________________) and (___________________):
            
        yes = ____________________________________

        return ____________________________________(yes, no)
            
    return ____________________________________


def has_sum(total, n, m):
    """
    >>> has_sum(1, 3, 5)
    False
    >>> has_sum(5, 3, 5) # 0 * 3 + 1 * 5 = 5
    True
    >>> has_sum(11, 3, 5) # 2 * 3 + 1 * 5 = 11
    True
    """
    if ____________________________________________________:

        return ____________________________________

    elif __________________________________________________:

        return ____________________________________

    return ________________________________________________



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


def modular_exponentiation(base, exponent, modulus):
    """
    >>> modular_exponentiation(2, 2, 2)
    0
    >>> modular_exponentiation(4, 2, 3)
    1
    """
    if _____________________:

        return ____________________________________

    if _____________________:
            
        half_power = ____________________________________

        return ____________________________________ % modulus

    else:  

        return _________________________________________ % modulus


