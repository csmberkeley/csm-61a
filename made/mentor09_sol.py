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


def __init__(self, value, next=empty, prev=empty):
  self.value = value
  self.next = next
  self.prev = prev
def add_last(self, value):
  pointer = self
  while pointer.next != DLList.empty:
    pointer = pointer.next
  pointer.next = DLList(value, DLList.empty, pointer)
def add_first(self, value):
  old_first = DLList(self.value, self.next, self)
  self.value = value
  self.next = old_first
  if old_first.next != DLList.empty:
    old_first.next.prev = old_first


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
class PingPongTracker:
    def __init__(self):
        self.current = 0
        self.index = 1
        self.add = True

    def next(self):
        if self.add:
            self.current += 1
        else:
            self.current -= 1
        if has_seven(self.index) or self.index % 7 == 0:
            self.add = not self.add
        self.index += 1
        return self.current



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
            return f"Reprtilia({repr(self.name)}, {repr(self.scientific)})"
            def __str__(self):
            return f"a {self.name} is a \"{self.scientific}\""
        """
        >>> python = ReprtiliaNoises("python", "pythonidae", "hiss")
        >>> python
        ReprtiliaNoises('python', 'pythonidae', 'hiss')
        >>> f"Today's reptile of the day is a {python}!"
        "Today's reptile of the day is a python (species: 'pythonidae', noise: 'hiss')!"
        """
            class ReprtiliaNoises(Reprtilia):
                def __init__(self, name, scientific, noise):
                    super().__init__(name, scientific)
                    self.noise = noise
                def __repr__(self):
                return f"ReprtiliaNoises({repr(self.name)}, {repr(self.scientific)}, {repr(self.noise)})"
                def __str__(self):
                return f"{self.name} (species: \'{self.scientific}\', noise: \'{self.noise}\')"


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
        self.leaf = Leaf(self)
        self.materials = []
        self.height = 1

    def absorb(self):
        self.leaf.absorb()

    def grow(self):
        for sugar in self.materials:
            sugar.activate()
            self.height += 1

class Leaf:
    def __init__(self, plant): # plant is a Plant instance
        self.alive = True
        self.sugars_used = 0
        self.plant = plant

    def absorb(self):
        if self.alive:
            self.plant.materials.append(Sugar(self, self.plant))


    def __repr__(self):
        return '|Leaf|'

class Sugar:
    sugars_created = 0

    def __init__(self, leaf, plant):
        self.leaf = leaf
        self.plant = plant
        Sugar.sugars_created += 1

    def activate(self):
        self.leaf.sugars_used += 1
        self.plant.materials.remove(self)

    def __repr__(self):
        return '|Sugar|'


