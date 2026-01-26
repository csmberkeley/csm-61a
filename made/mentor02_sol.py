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


def score_needed(current_grade, num_exams, pass_grade):
    '''
    >>> score_needed(89, 4, 90)
    94
    >>> score_needed(65, 2, 70)
    80
    >>> score_needed(77, 10, 78)
    88
    '''
    

    def score_needed(current_grade, num_exams, pass_grade):
        total_pts = current_grade * num_exams
        total_needed = pass_grade * (num_exams + 1)
        return total_needed - total_pts



def divisibility_check(num):

def divisibility_check(num):
    if num % 4 == 0:
        return True
    elif num % 7 == 0:
        return 1
    else:
        return False
def divisibility_check(num):
    return True if num % 4 == 0 else 1 if num % 7 == 0 else False


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
    i = 1
    while i <= n:
        if i % 3 == 0 and i % 5 == 0:
            print('fizzbuzz')
        elif i % 3 == 0:
            print('fizz')
        elif i % 5 == 0:
            print('buzz')
        else:
            print(i)
        i += 1
        if i % 3 == 0:
            print('fizz')
        elif i % 3 == 0 and i % 5 == 0:
            print('fizzbuzz')
        elif i % 5 == 0:
            print('buzz')
        else:
            print(i)


