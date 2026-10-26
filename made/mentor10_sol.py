def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


def make_fib():
    cache = {0: 0, 1: 1}
    def fib(n):
        if n not in cache:
            cache[n] = fib(n - 1) + fib(n - 2)
        return cache[n]
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
['Hi, Ada', 'Hi, Bo', 'Hi, Cam']
['Hi, Cam', 'Hi, Bo', 'Hi, Ada']
def greetings_d(names):
    return ['Hi, ' + names[i]
            for i in range(len(names) - 1, -1, -1)]


class Poll:
    s = []
    def __init__(self, n):
        self.name = n
        self.votes = {}
        Poll.s.append(self)
    def vote(self, choice):
        self.votes[choice] = self.votes.get(choice, 0) + 1

def tally(c):
    return [(p.name, p.votes[c]) for p in Poll.s if c in p.votes]


def max_subset_sum(lst, n):
    if n == 0:
        return 0
    elif len(lst) <= n:
        return sum(lst)
    with_elem = max_subset_sum(lst[1:], n - 1) + lst[0]
    without_elem = max_subset_sum(lst[1:], n)
    return max(with_elem, without_elem)


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


