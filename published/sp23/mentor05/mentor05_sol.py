def gib(n):
    if n <= 2:
        return n
    return gib(n - 1) + gib(n - 2) + gib(n - 3)


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


def selective_sum(n, cond):
    if n <= 0:
        return 0
    if cond(n):
        return n + selective_sum(n - 1, cond)
    return selective_sum(n - 1, cond)


    def fit_sections(total, n, m):
        if total == 0:
            return True
        elif total < 0: # you could also put total < min(m, n)
            return False
        return fit_sections(total - n, n, m) or fit_sections(total - m, n, m)
    def fit_sections(total, n, m):
        if total == 0 or total % n == 0 or total % m == 0:
            return True
        elif total < 0: # you could also put total < min(m, n)
            return False
        return fit_sections(total - n, n, m) or fit_sections(total - m, n, m)


def mario_number(level):
    if level == 1:
        return 1
    elif level % 10 == 0:
        return 0
    else:
        return mario_number(level // 10) + mario_number((level // 10) // 10)


def collapse(n):
    rest, last = n // 10, n % 10
    if rest == 0:
        return last
    elif last == rest % 10:
        return collapse(rest)
    else:
        return collapse(rest) * 10 + last


