

def factorial(n):
    return n * factorial(n)
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)


    if n == 0:
        return 0
    if is_prime(n % 10):
        return n % 10 + sum_prime_digits(n // 10)
    return sum_prime_digits(n // 10)


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
    if n < 10:
        return 1
    else:
        return 1 + num_digits(n // 10)


def combine(n, f, result):
    if n == 0:
        return result
    else:
        return combine(n // 10, f, f(n % 10, result))


def positionizer(n):
  def helper(n, pos):
    if n == 0:
      return 0
    rest = helper(n // 10, pos + 1) * 10
    if n % 10 == pos:
      return rest + n % 10
    else:
      return rest + (n % 10) % pos
  return helper(n, 1)
def max_positionizer(k, lst):
  def make_nums(k,lst):
    if k == 0: # Note that the check for k must come first 
               # (what should be returned if k == 0 and 
               # len(lst) == 0?)
      return [0]
    elif len(lst) == 0:
      return []
    a =  [lst[0] * 10**(k - 1) + rest \
            for rest in make_nums(k - 1, lst[1:])]
    b = make_nums(k, lst[1:])
    return a + b
  return max(make_nums(k, lst), key=positionizer)




def gib(n):
    if n <= 2:
        return n
    return gib(n - 1) + gib(n - 2) + gib(n - 3)


def mario_number(level):
    if level == 1:
        return 1
    elif level % 10 == 0:
        return 0
    else:
        return mario_number(level // 10) + mario_number((level // 10) // 10)


def make_change(n):
    if n == 0:
        return 0
    elif n < 3:
        return 1 + make_change(n - 1)
    elif n < 4:
        return 1 + min(make_change(n - 1), make_change(n - 3))
    else:
        return 1 + min(make_change(n - 1), make_change(n - 3), make_change(n - 4))


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


