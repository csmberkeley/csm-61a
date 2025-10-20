class Bird:
    def __init__(self, call):
        self.call = call
        self.can_fly = True
    def fly(self):
        if self.can_fly:
            return "Don't stop me now!"
        else:
            return "Ground control to Major Tom..."
    def speak(self):
        print(self.call)

class Chicken(Bird):
    def speak(self, other):
        Bird.speak(self)
        other.speak()

class Penguin(Bird):
    can_fly = False
    def speak(self):
        call = "Ice to see you"
        print(call)

andre = Chicken("cluck")
gunter = Penguin("noot")
>>> andre.speak(Bird("coo"))
>>> andre.speak()
>>> gunter.fly()
>>> andre.speak(gunter)
>>> Bird.speak(gunter)


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
("blue", 25)
>>> obiwan = Jedi("Obi-wan")
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
("red", 50.0)
>>> Jedi.lightsaber 
"blue"
>>> print(Sith("Vader"), Sith("Maul").num_sith)
Two there should be. No more, no less.
Darth Vader 3
>>> rey = ForceWielder("Rey")
>>> rey
<__main__.ForceWielder object>
>>> rey.lightsaber
AttributeError


>>> a = Link(1, Link(2, Link(3)))
+---+---+  +---+---+  +---+---+
| 1 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
1
>>> a.first = 5
+---+---+  +---+---+  +---+---+
| 5 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
   +---+---+  +---+---+  +---+---+
+->| 5 | --|->| 2 | --|->| 3 | --|--+
|  +---+---+  +---+---+  +---+---+  |
|                                   |
+-----------------------------------+
>>> a.rest.rest.rest.rest.first
2
>>> repr(Link(1, Link(2, Link(3, Link.empty))))
"Link(1, Link(2, Link(3)))"
>>> Link(1, Link(2, Link(3, Link.empty)))
Link(1, Link(2, Link(3)))
>>> str(Link(1, Link(2, Link(3))))
'<1 2 3>'
>>> print(Link(Link(1), Link(2, Link(3))))
<<1> 2 3>


def reverse(lst):
    """
    >>> a = Link(1, Link(2, Link(3)))
    >>> b = reverse(a)
    >>> b
    Link(3, Link(2, Link(1)))
    >>> a
    Link(1, Link(2, Link(3)))
    """
# Recursive w/ Helper
def reverse(lst):
    def helper(so_far, rest):
        if rest is Link.empty:
            return so_far
        else:
            return helper(Link(rest.first, so_far), rest.rest)
    return helper(Link.empty, lst)

# Iterative
def reverse(lst):
    rev = Link.empty
    while lst is not Link.empty:
        rev = Link(lst.first, rev)
        lst = lst.rest
    return rev


    def insert_all(s, x, index):
        """
        >>> insert = Link(3, Link(4))
        >>> original = Link(1, Link(2, Link(5)))
        >>> insert_all(original, insert, 2)
        Link(1, Link(2, Link(3, Link(4, Link(5)))))
        >>> start = Link(1)
        >>> insert_all(original, start, 0)
        Link(1, Link(1, Link(2, Link(5))))
        >>> insert_all(original, insert, 3)
        Link(1, Link(2, Link(5, Link(3, Link(4)))))
        """
        if s is Link.empty and x is Link.empty:
            return Link.empty
        if x is not Link.empty and index == 0:
            return Link(x.first, insert_all(s, x.rest, 0))
        return Link(s.first, insert_all(s.rest, x, index - 1))


