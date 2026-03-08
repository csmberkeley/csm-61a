>>> a = [1, 2, 3]
>>> x = iter(a)
N/A
>>> next(x)
1
>>> next(x)
2
>>> y = iter(a)
>>> next(y)
1
>>> next(x)
3
>>> next(x)
StopIteration Error
>>> z = iter(y) 
>>> next(z)
2
>>> [next(y), next(y), next(z)]
[2, 3, 3]


>>> x = [1, 2, 3]
>>> y = map(lambda x : x + 10, x)
N/A
>>> next(y)
11
>>> [z for z in y]
[12, 13]
>>> next(y)
StopIteration


def foo():
    a = 0
    if a == 0:
        print("Hello")
        yield a
        print("World")

>>> foo()
<generator object>
>>> foo_gen = foo()
>>> next(foo_gen)
Hello
0
>>> next(foo_gen)
World
StopIteration
>>> for i in foo():
...   print(i)
Hello
0
World


def accumulate(it):
    '''
    >>> def all_ints():
    ...     i = 0
    ...     while True:
    ...         yield i
    ...         i += 1
    >>> a = accumulate(all_ints())
    >>> [next(a) for x in range(6)]
    [0, 1, 3, 6, 10, 15]
    '''
def accumulate(it):
    sum = 0
    while True:
        sum += next(it)
        yield sum


def filter_gen(s, f):
    """
    >>> list(filter_gen([1, 2, 3, 4, 5],
                                lambda x: x % 2 == 0))
    [2, 4]
    >>> list(filter_gen((1, 2, 3, 4, 5), lambda x: x < 3))
    [1, 2]
    """
for x in s:
    if f(x):
        yield x


class Car:
    wheels = 4
    def __init__(self, gas):
        self.gas = gas

    def drive(self):
        if self.gas <= 0:
            print("Out of gas")
        else:
	      self.gas -= 1
    
    def fill(self, gas):
        self.gas += gas

>>> c1 = Car(2)
>>> c1.gas
>>> c1.drive()
>>> c1.gas
>>> c1.drive()
>>> c1.drive()
>>> c1.fill(10)
>>> c1.drive()
>>> c1.gas
>>> c1.wheels
>>> Car.wheels


        def year(a):
            x = iter(a)
            y = iter(a)
            z = iter(x)
            for i in range(next(x)):
                y = iter(a)
                next(y)
            print(next(x))
            print(next(z))
            print(next(y))
            print(next(z))
        year([__, 2, 0, 6, ___])
        There can be any number in the first blank, and there can be any number of values after the 6.


