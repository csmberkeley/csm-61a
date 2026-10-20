>>> a = [1, 2]
>>> a[1]
>>> a.append([3, 4])
>>> a
>>> b = a[1:]
>>> a[1] = 5
>>> a[2][0] = 6
>>> b
>>> a.extend([7])
>>> a += [8]
>>> a
>>> a += 9


a = [1, 2, [3]]

def mystery(s, t):
    s.pop(1)
    return t.append(s)
    
b = a
a += [b[0]]
a = mystery(b, a[1:])


def insert_n(lst, x, n):
    """
    >>> lst = []
    >>> insert_n(lst, 4, 1)
    >>> insert_n(lst, 1, 3)
    >>> insert_n(lst, 2, 2)
    >>> lst
    [1, 1, 1, 2, 2, 4]
    >>> insert_n(lst, 1, -2)
    >>> lst
    [1, 2, 2, 4]
    """
    if n > 0:
        i = 0
        while ______________________________________:

            ______________________________________

        ______________________________________:

            ______________________________________
    elif n < 0:

        ______________________________________

            ______________________________________


from dataclasses import dataclass

@dataclass
class Ticket:
    exhibit: str
    remaining: int = 2

    def admit(self):
        if self.remaining > 0:
            self.remaining -= 1
            return True
        return False

original = Ticket("Space")
alias = original
separate = Ticket("Space", 1)
>>> original.remaining, separate.remaining
>>> alias.admit()
>>> original.remaining, separate.remaining
>>> original is alias, original is separate
>>> alias = Ticket("Ocean")
>>> alias.remaining = 5
>>> original.exhibit, original.remaining, alias.remaining
>>> original.admit(), original.admit(), original.remaining


class Account:
    interest = 2

    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount
        return self.balance

a = Account("Ada", 10)
>>> a.interest = 7
>>> Account.interest = 4
>>> a.interest, Account("Bob").interest


class Counter:
    step = 1

    def __init__(self, value):
        self.value = value

    def advance(self):
        self.value += self.step
        return self.value

left = Counter(0)
right = Counter(10)
saved = left.advance
>>> Counter.step = 3
>>> left.step = 2
>>> left.step, right.step, Counter.step
>>> saved()
>>> Counter.advance(right)
>>> left = right
>>> saved()
>>> left.value, right.value


def labels_at_depth(t: Tree, k: int) -> list[int]:
    """
    >>> t = Tree(1, [Tree(2, [Tree(4), Tree(5)]),
    ...              Tree(3, [Tree(6)])])
    >>> labels_at_depth(t, 0)
    [1]
    >>> labels_at_depth(t, 1)
    [2, 3]
    >>> labels_at_depth(t, 2)
    [4, 5, 6]
    >>> labels_at_depth(t, 3)
    []
    >>> labels_at_depth(Tree(9), 1)
    []
    """
    if _________________________________:

        return _________________________

    result = []

    for b in ___________________________:

        result.extend(__________________)

    return result


