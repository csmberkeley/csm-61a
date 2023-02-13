

def swap(x, y):
    x, y = y, x
    return print("Swapped!", x, y)

x, y = 60, 1
a = swap(x, y)
swap(a, y)


def funny(joke):
    hoax = joke + 1
    return funny(hoax)

def sad(joke):
    hoax = joke - 1
    return hoax + hoax

funny, sad = sad, funny
result = funny(sad(2))




x = 20
def foo(y):
    x = 5
    def bar():
        return lambda y: x - y
    return bar

y = foo(7)
z = y()
print(z(2))


(lambda x: lambda y: ________________)(_____)(lambda z: z*z)()


def whole_sum(n): 
    """ 
    >>> whole_sum(21)(777)
    True
    >>> whole_sum(142)(10010101010)
    False
    """
    def check(x):

        ___________________
		
        while _____________:
		
            last = __________________
				
            _________________________
				
            _________________________
				
        return __________________
		
    return _________________



def mystery(f, x):
    def helper(y):
        return f(x, y)
    return helper

>>> foo = mystery(lambda a, b: a(b), lambda c: 5 + square(c))
>>> foo(-2)




