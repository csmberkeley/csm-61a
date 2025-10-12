def accumulate(it):
    '''
    >>> def all_ints():
    ...     i = 0
    ...     while True:
    ...         yield i
    ...         i += 1
    >>> a = accumulate(all_ints())
    >>> [next(a) for x in range(6)]
    [0, 1, 3, 6, 10, 15]
    '''
def accumulate(it):
    sum = 0
    while True:
        sum += next(it)
        yield sum


def all_sums(lst):
    '''
    >>> list(all_sums([]))
    [0] 
    >>> list(all_sums([1, 2]))
    [3, 2, 1, 0]
    >>> list(all_sums([1, 2, 3]))
    [6, 5, 4, 3, 3, 2, 1, 0]
    >>> list(all_sums([1, 2, 7]))
    [10, 9, 8, 7, 3, 2, 1, 0]
    '''
    if len(lst) == 0:
        yield 0
    else:
        for sum_rest in all_sums(lst[1:]):
            yield sum_rest + lst[0]
            yield sum_rest


        def fruitOptions(m, pc, ac): 
            if m < pc and m < ac:
                yield ''
            if m >= pc:
                for p in fruitOptions(m-pc, pc, ac):
                    yield 'pear ' + p;
            if m >= ac:
                for a in fruitOptions(m-ac, pc, ac):
                    yield 'apple ' + a;    


>>> oski = Bear('Oski')
>>> oski.name
'Oski'
>>> Bear.bears
['Oski']
>>> winnie = Bear('Winnie')
>>> Bear.bears
['Oski', 'Winnie']

class Bear:
    bears = []
    def __init__(self, name):
        self.name = name
        Bear.bears.append(self.name)


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


class Musician:
    popularity = 0
    def __init__(self, instrument):
        self.instrument = instrument
    def perform(self):
        print('a stellar ' + self.instrument + ' performance')
        self.popularity = self.popularity + 2
    def __repr__(self):
        return self.instrument

class BandLeader(Musician):
    def __init__(self):
        self.band = []
    def recruit(self, musician):
        self.band.append(musician)
    def perform(self, song):
        for m in self.band:
            m.perform()
        Musician.popularity += 1
        print(song)
    def __str__(self):
        return 'Here's the band!'
    def __repr__(self):
        band = ''
        for m in self.band:
            band += str(m) + ' ' 
        return band[:-1]

miles = Musician('trumpet')
goodman = Musician('clarinet')
ellington = BandLeader()
>>> ellington.recruit(goodman)
>>> ellington.perform()
>>> ellington.perform('sing, sing, sing')
>>> goodman.popularity, miles.popularity
>>> ellington.recruit(miles)
>>> ellington.perform('caravan')
>>> ellington.popularity, goodman.popularity, miles.popularity
>>> print(ellington)
>>> ellington


