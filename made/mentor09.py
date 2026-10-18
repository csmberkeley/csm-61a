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
>>> obiwan = Jedi("Obi-wan")
>>> anakin.master = obiwan
>>> anakin.master
>>> Jedi.master
>>> obiwan.force += anakin.force
>>> obiwan.force, anakin.force
>>> obiwan.train(anakin)
>>> obiwan.force, anakin.force
>>> Jedi.train(obiwan, anakin)
>>> obiwan.force, anakin.force
>>> sidious = Sith("Sidious")
>>> ForceWielder.train(sidious, anakin)
>>> anakin.lightsaber = "red"
>>> anakin.lightsaber, anakin.force
>>> Jedi.lightsaber 
>>> print(Sith("Vader"), Sith("Maul").num_sith)
>>> rey = ForceWielder("Rey")
>>> rey
>>> rey.lightsaber


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
class TeamBaller(_______________):
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
    def pass_ball(_______________, ________________):
        ________________________________________
        ____________________
            ________________________________
        __________
            ________________________________
        ____________________




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
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
>>> reduce(lambda x, y: x + y, a)


a = [1, 'A', 'B', 'C', 5, 6, 7, 'D', 'E']
x = iter(a)
for i in range(5 - next(x)):
    next(x)
print(next(x))
y = iter(a)
print(next(y))
z = iter(y)
print(next(z))


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
>>> foo_gen = foo()
>>> next(foo_gen)
>>> next(foo_gen)
>>> for i in foo():
...   print(i)


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
    """


    def fruitOptions(m, pc, ac):
        """
        >>> print(list(fruitOptions(10, 2, 5)))
        ['pear pear pear pear pear ', 'pear pear apple ', 'pear apple pear ',
         'apple pear pear ', 'apple apple ']
        """
        if __________________________________:
            yield ""
        if m >= pc:
            for ______________________________________:
                ________________________________
        if m >= ac:
            for ______________________________________:
                ____________________________________
                


