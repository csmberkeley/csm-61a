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


3 + 4
7
'3' + 4
TypeError
'3 + 4'
'3 + 4'
'3' + '4'
'34'


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


def fahrenheitToCelsius(f):
    """
    >>> fahrenheitToCelsius(32)
    0.0
    >>> fahrenheitToCelsius(104)
    40.0
    """




def fahrenheitToCelsius(f):
    return (f - 32) * (5/9)



def score_needed(current_grade, num_exams, pass_grade):
    """
    >>> score_needed(89, 4, 90)
    94
    >>> score_needed(65, 2, 70)
    80
    >>> score_needed(77, 10, 78)
    88
    """
    

    def score_needed(current_grade, num_exams, pass_grade):
        total_pts = current_grade * num_exams
        total_needed = pass_grade * (num_exams + 1)
        return total_needed - total_pts


>>> from operator import sub, mul
>>> def print_sub(x, y):
...     print('sub')
...     return sub(x, y)
>>> def print_mul(x, y):
...     print('mul')
...     return mul(x, y)
>>> print_sub(print_mul(505, 4), 3)
mul
sub
2017


