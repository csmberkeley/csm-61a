>>> a = [1, 2, 3]
>>> a
[1, 2, 3]
>>> a[2]
>>> a[-1]
>>> b = a
>>> a = a + [4, [5, 6]]
>>> a
[1, 2, 3, 4, [5, 6]]
>>> b
[1, 2, 3]
>>> c = a
>>> a = [4, 5]
>>> a
[4, 5]
>>> c
[1, 2, 3, 4, [5, 6]]
>>> d = c[3:5]
>>> c[3] = 9
>>> d

[4, [5, 6]]
>>> c[4][0] = 7
>>> d
[4, [7, 6]]
>>> c[4] = 10
>>> d
[4, [7, 6]]
>>> c
[1, 2, 3, 9, 10]


>>> t: tuple[int, str, float, bool, None] = (
...     3, "csm", 2.5, True, None
... )
>>> t
(3, 'csm', 2.5, True, None)
>>> 4, 5, 6, 7
(4, 5, 6, 7)
>>> (3,)
(3,)
>>> (3)
3
>>> ()
>>> len(())
()
0
>>> t[1:4]
('csm', 2.5, True)
>>> t[::-1]
(None, True, 2.5, 'csm', 3)
>>> list(t)
[3, 'csm', 2.5, True, None]
>>> list("csm")
>>> list(())
['c', 's', 'm']
[]
>>> (4, 5) + (6, 7)
(4, 5, 6, 7)
>>> (3,) * 3
>>> (3) * 3
(3, 3, 3)
9
>>> t[0] = 4
TypeError
>>> locations = {(4, 5): "CSM"}
>>> locations[(4, 5)]
'CSM'
>>> locations[[4, 5]] = "office hours"
TypeError
>>> locations[(4, [5])] = "office hours"
TypeError


    new_list = []
    for x in lst:
         for i in range(x):
              new_list = new_list + [x]
    return new_list


def all_primes(nums):
    result = []
    for i in nums:
        if is_prime(i):
            result = result + [i]
    return result

    List comprehension:
    return [x for x in nums if is_prime(x)]


def gen_list(n):
    return [[i for i in range(j+1)] for j in range(n)]

def gen_increasing(n):
    return [[i for i in range(sum(range(j+1)), sum(range(j+1)) + j+1)] for j in range(n)]
def gen_increasing(n):
    return [[i + sum(range(j + 1)) for i in range(j + 1)] for j in range(n)]


    count = 0
    for c in word:
        if c == 't':
            count += 1
    d[word] = count


def snapshot(f, snap_inputs):
    snap = {}
    for snap_input in snap_inputs:
        snap[snap_input] = f(snap_input)
    return snap




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


>>> a = Link(1, Link(2, Link(3)))
+---+---+  +---+---+  +---+---+
| 1 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
1
>>> a.first = 5
+---+---+  +---+---+  +---+---+
| 5 | --|->| 2 | --|->| 3 | / |
+---+---+  +---+---+  +---+---+
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
   +---+---+  +---+---+  +---+---+
+->| 5 | --|->| 2 | --|->| 3 | --|--+
|  +---+---+  +---+---+  +---+---+  |
|                                   |
+-----------------------------------+
>>> a.rest.rest.rest.rest.first
2
>>> repr(Link(1, Link(2, Link(3, Link.empty))))
"Link(1, Link(2, Link(3)))"
>>> Link(1, Link(2, Link(3, Link.empty)))
Link(1, Link(2, Link(3)))
>>> str(Link(1, Link(2, Link(3))))
'<1 2 3>'
>>> print(Link(Link(1), Link(2, Link(3))))
<<1> 2 3>


def linkify_rec(lst):
    if not lst:
        return Link.empty
    else:
        return Link(lst[0], linkify_rec(lst[1:]))

def linkify_iter(lst):
    retVal = Link.empty
    for elem in lst[::-1]:
        retVal = Link(elem, retVal)
    return retVal


def combine_two(lnk, fn):
    if lnk is Link.empty:
        return Link.empty
    elif lnk.rest is Link.empty:
        return Link(lnk.first)
    combined = fn(lnk.first, lnk.rest.first)
    return Link(combined, combine_two(lnk.rest.rest, fn))


def donut(d, f):
    if d == 0:
        return 1
    if f == 0:
        return 0
    return donut(d - 1, f) + donut(d, f - 1)


