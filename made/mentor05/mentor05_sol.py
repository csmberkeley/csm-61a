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
    if n == 1:
        print(n)
    else:
        celeb_fizzbuzz(n - 1)
        if n % 3 == 0 and n % 5 == 0:
            print('SwiftYe')
        elif n % 3 == 0:
            print('Kanye')
        elif n % 5 == 0:
            print('Taylor')
        else:
            print(n)


    if n == 0:
        return 0
    if is_prime(n % 10):
        return n % 10 + sum_prime_digits(n // 10)
    return sum_prime_digits(n // 10)


def has_sum(total, n, m):
    if total == 0:
        return True
    elif total < 0: # you could also put total < min(m, n)
        return False
    return has_sum(total - n, n, m) or has_sum(total - m, n, m)
def has_sum(total, n, m):
    if total == 0 or total % n == 0 or total % m == 0:
        return True
    elif total < 0: # you could also put total < min(m, n)
        return False
    return has_sum(total - n, n, m) or has_sum(total - m, n, m)


def mario_number(level):
    if level == 1:
        return 1
    elif level % 10 == 0:
        return 0
    else:
        return mario_number(level // 10) + mario_number((level // 10) // 10)


    def modular_exponentiation(base, exponent, modulus):
    # Base case: exponent is 0
    if exponent == 0:
        return 1
    
    # Recursive case
    if exponent % 2 == 0: # If exponent is even
        half_power = modular_exponentiation(base, exponent // 2,modulus)
        return (half_power * half_power) % modulus
    else: # If exponent is odd
        half_power = modular_exponentiation(base, (exponent - 1) // 2, modulus)
        return (base * half_power * half_power) % modulus


