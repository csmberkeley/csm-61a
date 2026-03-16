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


class DLList:
  """
  >>> lst = DLList(6, DLList(1))
  >>> lst.value
  6
  >>> lst.next.value
  1
  >>> lst.prev.value
  AttributeError: 'NoneType' object has no attribute 'value'
  """
  empty = None
  def __init__(self, value, next=empty, prev=empty):

    ________________________________

    ________________________________

    ________________________________
  def add_last(self, value):
    """
    >>> lst = DLList(6)
    >>> lst.add_last(1)
    >>> lst.value
    6
    >>> lst.next.value
    1
    >>> lst.next.prev.value
    6
    """
    pointer = self
    while ________________________________:

      _____________________________________

    _______________ = DLList(____________________________)
  def add_first(self, value):
    """
    >>> lst = DLList('A')
    >>> lst.add_first(1)
    >>> lst.value
    1
    >>> lst.next.value
    'A'
    >>> lst.next.prev.value
    1
    >>> lst.add_first(6)
    >>> lst.value
    6
    >>> lst.next.next.prev.value
    1
    """
    old_first = DLList(____________________________)

    _______________ = _______________________________

    _______________ = _______________________________

    if ______________________________:

      _______________________________________________


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


        """
        >>> python = Reprtilia("python", "pythonidae")
        >>> iguana = Reprtilia("iguana", "iguana")
        >>> python
        Reptilia('python', 'pythonidae')
        >>> f'Did you know that {python}?"
        'Did you know that a python is a "pythonidae"?'
        """
    
        class Reprtilia:
            def __init__(self, name, scientific):
                self.name = name
                self.scientific = scientific
            def __repr__(self):
            def __str__(self):
        """
        >>> python = ReprtiliaNoises("python", "pythonidae", "hiss")
        >>> python
        ReprtiliaNoises('python', 'pythonidae', 'hiss')
        >>> f"Today's reptile of the day is a {python}!"
        "Today's reptile of the day is a python (species: 'pythonidae', noise: 'hiss')!"
        """
            class ReprtiliaNoises(Reprtilia):
                def __init__(self, name, scientific, noise):
                def __repr__(self):
                def __str__(self):


'''
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
'''
class Plant:
    def __init__(self):
        '''A Plant has a Leaf, a list of sugars created so far,
        and an initial height of 1.
        '''
        self.leaf = Leaf(self)
        self.materials = ___________
        self.height = ___________

    def absorb(self):
        '''Calls the Leaf to create sugar.'''






    def grow(self):
        '''A Plant consumes all of its sugars to grow, each of which
        increases its height by 1.
        '''






class Leaf:
    def __init__(self, plant): # plant is a Plant instance
        '''A Leaf is initially alive, and keeps track of how many
        sugars it has created.
        '''



    def absorb(self):
        '''If this Leaf is alive, a Sugar is added to the plant's
        list of sugars.
        '''
        if self.alive:


    def __repr__(self):
        return '|Leaf|'

class Sugar:
    sugars_created = 0

    def __init__(self, leaf, plant):



    def activate(self):
        '''A sugar is used.'''




    def __repr__(self):
        return '|Sugar|'


