def strange_add(n):
    if n == 0:
        return 1
    else:
        return strange_add(n - 1) + strange_add(n - 1)
def stranger_add(n):
    if n < 3:
        return n
    elif n % 3 ==  0:
        return stranger_add(n - 1) + stranger_add(n - 2) + stranger_add(n - 3)
    else:
        return n


def mystery(n):
    total = 0
    for i in range(n // 2):
        j = 1
        while j < n:
            j *= 2
            total += i * j
    return total
def foo(n):
    if n == 0:
        return
    for i in range(n // 2):
        print(i)
    foo(n // 2)


def exp(b, n):
    if n == 0:
        return 1
    else:
        return b * exp(b, n - 1)
def fast_exp(b, n):
    if n == 0:
        return 1
    elif n % 2 == 0: # Assume square runs in constant time
        return square(fast_exp(b, n // 2))
    else:
        return b * fast_exp(b, n - 1)
def fast_exp(b, n):
    for _ in range(50 * n):
        print("Killing time")
    if n == 0:
        return 1
    elif n % 2 == 0:
        return square(fast_exp(b, n // 2))
    else:
        return b * fast_exp(b, n - 1)


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

    return____________________________________________________________________


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


