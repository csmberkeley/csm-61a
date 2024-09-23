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
    if n == 1:
        print(n)
    else:
        fizzbuzz(n - 1)
        if n % 3 == 0 and n % 5 == 0:
            print('fizzbuzz')
        elif n % 3 == 0:
            print('fizz')
        elif n % 5 == 0:
            print('buzz')
        else:
            print(n)


    if n == 0:
        return 0
    if is_prime(n % 10):
        return n % 10 + sum_prime_digits(n // 10)
    return sum_prime_digits(n // 10)


    def near(n, smallest=10, d=10):
        if n == 0:
            return 0
        
        no = near(n//10, smallest, d)

        if (smallest > n % 10) and (n % 10 != d):
            yes = 10 * near(n//10, min(smallest, d), n%10) + n%10
            # OR yes = 10 * near(n//10, d, min(d, n%10)) + n%10
            return max(yes, no)

        return no



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
    if exponent % 2 == 0:
        half_power = modular_exponentiation(base, exponent // 2,modulus)
        return (half_power * half_power) % modulus
    else:
        return (base * modular_exponentiation(base, exponent - 1, modulus)) % modulus


