>>> 3
>>> "cs61a"
>>> x = 3
>>> x
>>> x = print("cs61a")
cs61a
>>> x
>>> print(print(print("cs61a")))
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
add(mul(2, 3), add(1, 4))
max(mul(1, 2), add(5, 6), 3, mul(mul(3, 4), 1), 7)



def divisibility_check(num):



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


def fact_limit(n, limit):
    """
    >>> fact_limit(5, 20) 
    20 # 5 * 4 = 20, but 5 * 4 * 3 = 60 > 20
    >>> fact_limit(5, 200) 
    120 # 5 * 4 * 3 * 2 * 1 = 120 < 200
    >>> fact_limit(5, 3) 
    1 # no partial product is less than 3
    """
    if ________________:

        ________________

    product = ________________

    ________________ = n - 1

    while ________________:

        ____________ = ____________  

        ____________ = ____________
        
    return ________________



