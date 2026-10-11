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


from dataclasses import dataclass

@dataclass
class Session:
    topic: str
    room: int
    minutes: int = 60

morning = Session("Recursion", 310)
afternoon = Session("Sequences", 205, 45)
>>> morning.topic
>>> morning.minutes
>>> afternoon.room
>>> afternoon.minutes
>>> morning.minutes + afternoon.minutes
>>> morning
>>> Session(room=220, topic="Linked lists").topic


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


