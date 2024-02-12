>>> 3
>>> "cs61a"
>>> x = 3
>>> x
>>> x = print("cs61a")
cs61a
>>> x
>>> print(print(print("cs61a")))
cs61a 
None 
None
>>> def f1(x):
...	return x + 1
>>> f1(3)
>>> f1(2) + f1(2 + 3)
>>> def f2(y):
...	return y / 0
>>> f2(4)
>>> def f3(x, y):
...	if x > y:
...		return x
...	elif x == y:
...		return x + y
...	else:
...		return y
>>> f3(1, 2)
>>> f3(5, 5)
>>> 1 or 2 or 3
>>> 1 or 0 or 3
>>> 4 and (2 or 1/0)
>>> 0 or (not 1 and 3)
>>> (2 or 1/0) and (False or (True and (0 or 1)))


add(1, mul(2, 3))
add(1, mul(2, 3))
add(1, 6)  
7
add(mul(2, 3), add(1, 4))
add(mul(2, 3), add(1, 4))  
add(6, add(1, 4))  
add(6, 5)  
11
max(mul(1, 2), add(5, 6), 3, mul(mul(3, 4), 1), 7)
max(mul(1, 2), add(5, 6), 3, mul(mul(3, 4), 1), 7)
max(2, add(5, 6), 3, mul(mul(3, 4), 1), 7)
max(2, 11, 3, mul(mul(3, 4), 1), 7)
max(2, 11, 3, mul(12, 1), 7)
max(2, 11, 3, 12, 7)
12


def divisibility_check(num):
    if num % 4 == 0:
        return True
    elif num % 7 == 0:
        return 1
    else:
        return False
def divisibility_check(num):
    return True if num % 4 == 0 else 1 if num % 7 == 0 else False


def pow_of_two(n):
    """
    >>> pow_of_two(6)
    1 
    2 
    4 
    >>> result = pow_of_two(16)
    1
    2
    4
    8
    16
    >>> result is None
    True
    """
    curr = 1
    while curr <= n:
        print(curr)
        curr *= 2 # equivalent to curr = curr * 2
    exponent = 0
    while (2 ** exponent) <= n:
        print(2 ** exponent)
        exponent += 1


def is_leap_year(year):
    return (year % 4 == 0 and year % 100 != 0) or year % 400 == 0


def fact_limit(n, limit):
    if n > limit:
        return 1
    product = n
    n = n - 1
    while product * n <= limit and n > 0:
        product = product * n  
        n = n - 1
    return product


