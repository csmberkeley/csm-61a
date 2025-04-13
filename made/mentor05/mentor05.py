def celeb_fizzbuzz(n):
    """Prints the numbers from 1 to n. If the number is divisible by 3, it
    instead prints 'Kanye'. If the number is divisible by 5, it instead prints
    'Taylor'. If the number is divisible by both, it prints 'SwiftYe'. You must do this recursively!

    >>> celeb_fizzbuzz(15)
    1
    2
    Kanye
    4
    Taylor
    Kanye
    7
    8
    Kanye
    Taylor
    11
    Kanye
    13
    14
    SwiftYe
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
        # Hint: Which math formula above has exponent *just* divided by half?

        return ____________________________________ % modulus

    else:  

        half_power = ____________________________________

        return _________________________________________ % modulus


