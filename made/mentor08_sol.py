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


def double_tree(t):
    """
    Given a tree, mutate it such that each entry appears
    twice.
    >>> t = Tree(1)
    >>> double_tree(t)
    >>> t.label
    1
    >>> t.branches[0].label
    1
    """
    if t.is_leaf():
        t.branches = [Tree(t.label)]
    else:
        for b in t.branches:
             double_tree(b)
        t.branches = [Tree(t.label, t.branches)]


from dataclasses import dataclass

@dataclass
class Session:
    topic: str
    room: int
    minutes: int = 60

morning = Session("Recursion", 310)
afternoon = Session("Sequences", 205, 45)
>>> morning.topic
'Recursion'
>>> morning.minutes
60
>>> afternoon.room
205
>>> afternoon.minutes
45
>>> morning.minutes + afternoon.minutes
105
>>> morning
Session(topic='Recursion', room=310, minutes=60)
>>> Session(room=220, topic="Linked lists").topic
'Linked lists'


class Foo(object):
    x = 'bam'

    def __init__(self, x):
        self.x = x

    def baz(self):
        return type(self).x + self.x

class Bar(Foo):
    x = 'boom'

    def __init__(self, x):
        Foo.__init__(self, 'er' + x)

foo = Foo('boo')
>>> bar = Bar('ang')
>>> Bar.x


