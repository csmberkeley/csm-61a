>>> a = [1, 2]
>>> a.append([3, 4])
>>> a
>>> b = list(a)
>>> a[0] = 5
>>> a[2][0] = 6
>>> b
>>> a.extend([7])
>>> a += [8]
>>> a += 9
>>> a
>>> b[2][1] = a[2:]
>>> a[2][1][0][0]


def jerry(jerry):
    def jerome(alex):
        alex.append(jerry[1:])
        return alex
    return jerome
			
ben = ['nice', ['ice']]
jerome = jerry(ben)
alex = jerome(['cream'])
ben[1].append(alex)
ben[1][1][1] = ben
print(ben)


def accumulate(lst):
    """
    >>> l = [1, 5, 13, 4]
    >>> accumulate(l)
    23
    >>> l
    [1, 6, 19, 23]
    >>> deep_l = [3, 7, [2, 5, 6], 9]
    >>> accumulate(deep_l)
    32
    >>> deep_l
    [3, 10, [2, 7, 13], 32]
    """
    sum_so_far = 0
    for ________________________________________:

	    ________________________________________

        if isinstance(___________________, list):

	    inside = ___________________________

            ____________________________________

        else:
            ____________________________________

            ____________________________________
    
    _________________________________


class SkipMachine:
    skip = 1
    def __init__(self, n=2):
        self.skip = n + SkipMachine.skip

    def generate(self):
        current = SkipMachine.skip
        while True:
            yield current
            current += self.skip
            SkipMachine.skip += 1

p = SkipMachine()
twos = p.generate()
SkipMachine.skip += 1
twos2 = p.generate()
threes = SkipMachine(3).generate()


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
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
>>> reduce(lambda x, y: x + y, a)


def in_order(t):
    """
    >>> t = tree(0, [tree(1), tree(2, [tree(3), tree(4)])])
    >>> list(in_order(t))
    [1, 0, 3, 2, 4]
    """


def all_sums(lst):
    """
    >>> list(all_sums([]))
    [0] 
    >>> list(all_sums([1, 2]))
    [3, 2, 1, 0]
    >>> list(all_sums([1, 2, 3]))
    [6, 5, 4, 3, 3, 2, 1, 0]
    >>> list(all_sums([1, 2, 7]))
    [10, 9, 8, 7, 3, 2, 1, 0]
    """


