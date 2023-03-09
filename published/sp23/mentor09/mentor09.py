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


1 2 3 4 5 6 [7] 6 5 4 3 2 1 [0] 1 2 [3] 2 1 0 [-1] 0 1 2 3 4
[5] [4] 5 6
>>> tracker1 = PingPongTracker()
>>> tracker2 = PingPongTracker()
>>> tracker1.next()
1
>>> tracker1.next()
2
>>> tracker2.next()
1

class PingPongTracker:
    def __init__(self):






    def next(self):


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


"""
>>> p = Plant()
>>> p.height
1
>>> p.materials
[]
>>> p.absorb()
>>> p.materials
[|Sugar|]
>>> Sugar.sugars_created
1
>>> p.leaf.sugars_used
0
>>> p.grow()
>>> p.materials
[]
>>> p.height
2
>>> p.leaf.sugars_used
1
"""
class Plant:
    def __init__(self):
        """A Plant has a Leaf, a list of sugars created so far,
        and an initial height of 1.
        """





    def absorb(self):
        """Calls the Leaf to create sugar."""






    def grow(self):
        """A Plant consumes all of its sugars to grow, each of which
        increases its height by 1.
        """






class Leaf:
    def __init__(self, plant): # plant is a Plant instance
        """A Leaf is initially alive, and keeps track of how many
        sugars it has created.
        """



    def absorb(self):
        """If this Leaf is alive, a Sugar is added to the plant's
        list of sugars.
        """
        if self.alive:


    def __repr__(self):
        return '|Leaf|'

class Sugar:
    sugars_created = 0

    def __init__(self, leaf, plant):



    def activate(self):
        """A sugar is used."""




    def __repr__(self):
        return '|Sugar|'


