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


def score_needed(current_grade, num_exams, pass_grade):
    '''
    >>> score_needed(89, 4, 90)
    94
    >>> score_needed(65, 2, 70)
    80
    >>> score_needed(77, 10, 78)
    88
    '''
    




def divisibility_check(num):



def fizzbuzz(n):
    """
    >>> result = fizzbuzz(16)
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
    16
    >>> result is None
    True
    """


