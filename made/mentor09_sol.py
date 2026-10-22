class Elphaba(object):
    magic = 'Defying Gravity'

    def __init__(self, magic):
        self.magic = magic

    def spell(self):
        return type(self).magic + ' and ' + self.magic

class Glinda(Elphaba):
    magic = 'Popular'

    def __init__(self, magic):
        Elphaba.__init__(self, 'good ' + magic)

elphaba = Elphaba('Wicked')
>>> glinda = Glinda('Power')
>>> Glinda.magic


class ForceWielder():
    force = 25

    def __init__(self, name):
        self.name = name

    def train(self, other):
        other.force += self.force / 5

    def __str__(self):
        return self.name

class Jedi(ForceWielder):
    lightsaber = "blue"

    def __str__(self):
        return "Jedi " + self.name

    def __repr__(self):
        return f"Jedi({repr(self.name)})"

class Sith(ForceWielder):
    lightsaber = "red"
    num_sith = 0

    def __init__(self, name):
        super().__init__(name)
        Sith.num_sith += 1
        if self.num_sith != 2:
            print("Two there should be. No more, no less.")
        
    def __str__(self):
        return "Darth " + self.name

    def __repr__(self):
        return f"Sith({repr(self.name)})"
>>> anakin = Jedi("Anakin")
>>> anakin.lightsaber, anakin.force
('blue', 25)
>>> obiwan = Jedi('Obi-wan')
>>> anakin.master = obiwan
>>> anakin.master
Jedi("Obi-wan")
>>> Jedi.master
AttributeError
>>> obiwan.force += anakin.force
>>> obiwan.force, anakin.force
(50, 25)
>>> obiwan.train(anakin)
>>> obiwan.force, anakin.force
(50, 35.0)
>>> Jedi.train(obiwan, anakin)
>>> obiwan.force, anakin.force
(50, 45.0)
>>> sidious = Sith("Sidious")
Two there should be. No more, no less.
>>> ForceWielder.train(sidious, anakin)
>>> anakin.lightsaber = "red"
>>> anakin.lightsaber, anakin.force
('red', 50.0)
>>> Jedi.lightsaber 
'blue'
>>> print(Sith("Vader"), Sith("Maul").num_sith)
Two there should be. No more, no less.
Darth Vader 3
>>> rey = ForceWielder("Rey")
>>> rey
<__main__.ForceWielder object>
>>> rey.lightsaber
AttributeError


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
class TeamBaller(Baller):
    """
    >>> alyssa = BallHog('Alyssa')
    >>> cheerballer = TeamBaller('Esther', has_ball=True)
    >>> cheerballer.pass_ball(alyssa)
    Yay!
    True
    >>> cheerballer.pass_ball(alyssa)
    I don't have the ball
    False
    """
    def pass_ball(self, other):
        did_pass = Baller.pass_ball(self, other)
        if did_pass:
            print('Yay!')
        else:
            print("I don't have the ball")
        return did_pass




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
StopIteration Error
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
-1
>>> from functools import reduce
>>> reduce(lambda x, y: x + y, a)
16


a = [1, 'A', 'B', 'C', 5, 6, 7, 'D', 'E']
x = iter(a)
for i in range(5 - next(x)):
    next(x)
print(next(x))
y = iter(a)
print(next(y))
z = iter(y)
print(next(z))
6
1
A


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
    """
    >>> def all_ints():
    ...     i = 0
    ...     while True:
    ...         yield i
    ...         i += 1
    >>> a = accumulate(all_ints())
    >>> [next(a) for x in range(6)]
    [0, 1, 3, 6, 10, 15]
    >>> list(accumulate(iter([1, 2, 3])))
    [1, 3, 6]
    >>> list(accumulate(iter([])))
    []
    """
def accumulate(it):
    total = 0
    for value in it:
        total += value
        yield total


        def fruitOptions(m, pc, ac): 
            if m < pc and m < ac:
                yield ""
            if m >= pc:
                for p in fruitOptions(m-pc, pc, ac):
                    yield "pear " + p;
            if m >= ac:
                for a in fruitOptions(m-ac, pc, ac):
                    yield "apple " + a;    


