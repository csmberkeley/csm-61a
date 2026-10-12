>>> a = [1, 2]
>>> a[1]
2
>>> a.append([3, 4])
>>> a
[1, 2, [3, 4]]
>>> b = a[1:]
>>> a[1] = 5
>>> a[2][0] = 6
>>> b
[2, [6, 4]]
>>> a.extend([7])
>>> a += [8]
>>> a
[1, 5, [6, 4], 7, 8]
>>> a += 9
TypeError: 'int' object is not iterable


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
        while i < len(lst) and lst[i] < x:
            i += 1
        for _ in range(n):
            lst.insert(i, x)
    elif n < 0:
        for _ in range(-n):
            lst.remove(x)


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
(1, 1)
(True, False)
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
Account.deposit(a, 10)


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
2
13
>>> left = right
>>> saved()
>>> left.value, right.value
4
(13, 13)


def labels_at_depth(t: Tree, k: int) -> list[int]:
    if k == 0:
        return [t.label]
    result = []
    for b in t.branches:
        result.extend(labels_at_depth(b, k - 1))
    return result


