>>> a = [1, 2, 3]
>>> x = iter(a)
>>> next(x)
>>> next(x)
>>> y = iter(a)
>>> next(y)
>>> next(x)
>>> next(x)
>>> z = iter(y) 
>>> next(z)
>>> [next(y), next(y), next(z)]


>>> x = [1, 2, 3]
>>> y = map(lambda x : x + 10, x)
>>> next(y)
>>> [z for z in y]
>>> next(y)


def foo():
    a = 0
    if a == 0:
        print("Hello")
        yield a
        print("World")

>>> foo()
>>> foo_gen = foo()
>>> next(foo_gen)
>>> next(foo_gen)
>>> for i in foo():
...   print(i)


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


def filter_gen(s, f):
    """
    >>> list(filter_gen([1, 2, 3, 4, 5],
                                lambda x: x % 2 == 0))
    [2, 4]
    >>> list(filter_gen((1, 2, 3, 4, 5), lambda x: x < 3))
    [1, 2]
    """


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


