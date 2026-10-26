def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


def make_fib():
    cache = {0: 0, 1: 1}
    def fib(n):
        if __________________________:
            cache[n] = __________________________
        return __________________________
    return fib
f = make_fib()
f(5)
f(5)
f(6)


def greetings_a(names):
    return ['Hi, ' + name for name in names]

def greetings_b(names):
    s = []
    for name in names:
        s.append('Hi, ' + name)
    return s

def greetings_c(names):
    s = []
    for name in names:
        s = s + ['Hi, ' + name]
    return s

def greetings_d(names):
    s = []
    for name in names:
        s.insert(0, 'Hi, ' + name)
    return s


class Poll:
    s = []

    def __init__(self, n):

        self.name = _________________________________________________

        self.votes = {}

        _____________________________________________________________

    def vote(self, choice):

        self._________________________ = ________________________________
    


def tally(c):
    """Tally all votes for a choice c as a list of (poll name, vote count) pairs.
    >>> a, b, c = Poll('A'), Poll('B'), Poll('C')
    >>> c.vote('dog')
    >>> a.vote('dog')
    >>> a.vote('cat')
    >>> b.vote('cat')
    >>> a.vote('dog')
    >>> tally('dog')
    [('A', 2), ('C', 1)]
    >>> tally('cat')
    [('A', 1), ('B', 1)]
    """

    return __________________________________________________________


def max_subset_sum(lst, n):
    """
    >>> max_subset_sum([1, 2, 3, 4], 2)
    7
    >>> max_subset_sum([1, 4, 2, 0, 6], 3)
    12
    """

    if _________________________:

        __________________________

    elif ________________________:

        __________________________

    with_elem = _____________________________ + _________

    without_elem = ____________________________________

    return ____________________________________________


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


