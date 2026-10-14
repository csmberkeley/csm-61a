def quick_maths(man, free):    
    print(man)
    if man % 2 == 0 and free:
        return quick_maths(man + 2, not free)
    else:
        man -= 1
        if man == 3:
            print(man)
        else:
            return man
big_shaq = 2
    
print(quick_maths(big_shaq, True))




def square(x):
    return x * x
subtract = lambda x, y: x - y
def greeting():
    return 'Hello, world!'


(lambda x: lambda y: ________________)(_____)(lambda z: z*z)()


x = 20
def foo(y):
    x = 5
    def bar():
        return lambda y: x - y
    return bar

y = foo(7)
z = y()
print(z(2))


def dream1(f):
    def dream2(secret):
        mind = f(secret)
        kick = lambda x: mind()
        return kick(2)
    return dream2

inception = lambda secret: lambda: secret
real = dream1(inception)(42)


def mystery(f, x):
    """
    >>> from operator import add, mul
    >>> a = mystery(add, 3)
    >>> a(4) # add(3, 4)
    7
    >>> a(12)
    15
    >>> b = mystery(mul, 5)
    >>> b(7) # mul(5, 7)
    35
    >>> b(1)
    5
    >>> c = mystery(lambda x, y: x * x + y, 4)
    >>> c(5)
    21
    >>> c(7)
    23
    """


def make_skipper(n):
    """
    >>> a = make_skipper(2)
    >>> a(5)
    1
    3
    5
    """


