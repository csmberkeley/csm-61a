>>> a = [1, 2]
>>> a.append([3, 4])
>>> a
[1, 2, [3, 4]]
>>> b = list(a)
>>> a[0] = 5
>>> a[2][0] = 6
>>> b
[1, 2, [6, 4]]
>>> a.extend([7])
>>> a += [8]
>>> a += 9
TypeError: 'int' object is not iterable
>>> a
[5, 2, [6, 4], 7, 8]
>>> b[2][1] = a[2:]
>>> a[2][1][0][0]
6


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
    sum_so_far = 0
    for i in range(len(lst)):
        item = lst[i]
        if isinstance(item, list):
            inside = accumulate(item)
            sum_so_far += inside
        else:
            sum_so_far += item
            lst[i] = sum_so_far
    return sum_so_far


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
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
-1
>>> reduce(lambda x, y: x + y, a)
16


def in_order(t):
    """
    >>> t = tree(0, [tree(1), tree(2, [tree(3), tree(4)])])
    >>> list(in_order(t))
    [1, 0, 3, 2, 4]
    """
def in_order(t):
    if is_leaf(t):
        yield label(t)
    else:
        yield from in_order(branches(t)[0])
        yield label(t)
        yield from in_order(branches(t)[1])


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
    if len(lst) == 0:
        yield 0
    else:
        for sum_rest in all_sums(lst[1:]):
            yield sum_rest + lst[0]
            yield sum_rest


