class Foo(object):
    x = 'bam'

    def __init__(self, x):
        self.x = x

    def baz(self):
        return type(self).x + self.x

class Bar(Foo):
    x = 'boom'

    def __init__(self, x):
        Foo.__init__(self, 'er' + x)

foo = Foo('boo')
>>> bar = Bar('ang')
>>> Bar.x


class Baller:
    all_players = []
    def __init__(self, name, has_ball = False):
       self.name = name
       self.has_ball = has_ball
       Baller.all_players.append(self)

    def pass_ball(self, other_player):
       if self.has_ball:
          self.has_ball = False
          other_player.has_ball = True
          return True
       else:
          return False

class BallHog(Baller):
    def pass_ball(self, other_player):
       return False

>>> richard = Baller('Richard', True)
>>> albert = BallHog('Albert')
>>> len(Baller.all_players)
>>> Baller.name
>>> len(albert.all_players)
>>> richard.pass_ball()
>>> richard.pass_ball(albert)
>>> richard.pass_ball(albert)
>>> BallHog.pass_ball(albert, richard)
>>> albert.pass_ball(richard)
>>> albert.pass_ball(albert, richard)


def in_order(t):
    """
    >>> t = tree(0, [tree(1), tree(2, [tree(3), tree(4)])])
    >>> list(in_order(t))
    [1, 0, 3, 2, 4] # 1 goes first because it's the leftmost node
    """
def in_order(t):
    if is_leaf(t):
        yield label(t)
    else:
        yield from in_order(branches(t)[0])
        yield label(t)
        yield from in_order(branches(t)[1])


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


def distinct_pairs(s):
 
    if len(s) >= 2:
        yield from  distinct_pairs(s[1:])  # (1)
        if  s[0] != s[1]:                  # (2)
            pair = (s[0], s[1])
             yield [pair]                  # (3)
            for rest in distinct_pairs(s[3:]):  # Note: [0, 1][3:]  
                                                # evaluates to []
                yield [pair] + rest]    # (4)


