def foo(x):
    def bar():
        print(x)
    return bar

x = foo(3)
y = foo(4)
x()
y()


a = 1
c = 2
def b(b):
    def d():
         return b + c
    return d()
c = b(a)
a = b(c)


def swap(x, y):
    x, y = y, x
    return print("Swapped!", x, y)

x, y = 60, 1
a = swap(x, y)
swap(a, y)


def hello_world():
    return 'Hello, world!'
hello_world()


>>> make_interval = _____________________________________
>>> in_interval = make_interval(-1, 2)
>>> in_interval(0)
True
>>> in_interval(61)
False



def a(y):
    d = 1
    b = lambda x: y(x)
    e = lambda x: x(3)
    return e(b)
d = 5
a(lambda x: 4 - x + d)


