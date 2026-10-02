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


class Bear:
    """
    >>> oski = Bear('Oski')
    >>> oski.name
    'Oski'
    >>> oski.organs
    []
    >>> Bear.bears
    ['Oski']
    >>> winnie = Bear('Winnie')
    >>> Bear.bears
    ['Oski', 'Winnie']
    """
    bears = []
    def __init__(self, name):
        self.name = name
        self.organs = []
        Bear.bears.append(self.name)
class Organ:
    """
    >>> oski, winnie = Bear('Oski'), Bear('Winnie')
    >>> oski_liver = Organ('liver', oski)
    >>> Organ.organ_counts
    {'Oski': 1}
    >>> winnie_stomach = Organ('stomach', winnie)
    >>> winnie_liver = Organ('liver', winnie)
    >>> winnie.organs
    [stomach, liver]
    >>> winnie_liver.discard()
    >>> Organ.organ_counts
    {'Oski': 1, 'Winnie': 1}
    >>> winnie.organs
    [stomach]
    """
    organ_counts = {}

    def __init__(self, name, bear):
        self.name = name
        self.bear = bear
        if bear.name in Organ.organ_counts:
            Organ.organ_counts[bear.name] += 1
        else:
            Organ.organ_counts[bear.name] = 1
        bear.organs.append(self)
    def discard(self):
        Organ.organ_counts[self.bear.name] -= 1
        self.bear.organs.remove(self)

    def __repr__(self):
        return self.name
class Heart(Organ):
    """
    >>> oski, winnie = Bear('Oski'), Bear('Winnie')
    >>> hasattr(oski, 'heart')
    False
    >>> oski_heart = Heart('small heart', oski)
    >>> oski.heart
    small heart
    >>> oski.organs
    [small heart]
    >>> new_heart = Heart('big heart', oski)
    >>> oski.heart
    big heart
    >>> oski.organs
    [big heart]
    >>> Organ.organ_counts["Oski"]
    1
    """
    def __init__(self, name, bear):
        if hasattr(bear, 'heart'):
            bear.heart.discard()
        bear.heart = self
        Organ.__init__(self, name, bear)



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


    if lst is Link.empty:
    	return Link.empty
     elif lst.rest is Link.empty:
        return Link(lst.first)
    return Link(lst.first, skip(lst.rest.rest))
def skip(lst):
    """
    >>> a = Link(1, Link(2, Link(3, Link(4))))
    >>> skip(a)
    >>> a
    Link(1, Link(3))
    """
def skip(lst): # Recursively
    if lst is Link.empty or lst.rest is Link.empty:
        return
    lst.rest = lst.rest.rest
    skip(lst.rest)

def skip(lst): # Iteratively
    while lst is not Link.empty and lst.rest is not Link.empty:
        lst.rest = lst.rest.rest
        lst = lst.rest
1 -> 2 -> 3 -> 4 -> 5
1 -> 3 -> 4 -> 5


def has_cycle(s):
    """
    >>> has_cycle(Link.empty)
    False
    >>> a = Link(1, Link(2, Link(3)))
    >>> has_cycle(a)
    False
    >>> a.rest.rest.rest = a
    >>> has_cycle(a)
    True
    """
    seen = []
    while s:
        if s in seen:
            return True
        seen.append(s)
        s = s.rest
    return False

    # Challenge solution

    if s is Link.empty:
        return False
    slow, fast = s, s.rest
    while fast is not Link.empty:
        if fast.rest is Link.empty:
            return False
        elif fast is slow or fast.rest is slow:
            return True
        slow, fast = slow.rest, fast.rest.rest
    return False


    def insert_at(s, x, index):
        """
        >>> insert = Link(3, Link(4))
        >>> original = Link(1, Link(2, Link(5)))
        >>> insert_at(original, insert, 2)
        Link(1, Link(2, Link(3, Link(4, Link(5)))))
        >>> start = Link(1)
        >>> insert_at(original, start, 0)
        Link(1, Link(1, Link(2, Link(5))))
        >>> insert_at(original, insert, 3)
        Link(1, Link(2, Link(5, Link(3, Link(4)))))
        """
        if s is Link.empty and x is Link.empty:
            return Link.empty
        if x is not Link.empty and index == 0:
            return Link(x.first, insert_at(s, x.rest, 0))
        return Link(s.first, insert_at(s.rest, x, index - 1))


