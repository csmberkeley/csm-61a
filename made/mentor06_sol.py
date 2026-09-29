>>> a = [1, 2, 3]
>>> a
[1, 2, 3]
>>> a[2]
3
>>> a[-1]
3
>>> a[1:]
[2, 3]
>>> a[:2]
[1, 2]
>>> a + [4, 5]
[1, 2, 3, 4, 5]
>>> a
[1, 2, 3]
>>> nested = [1, 2, 3, 4, [5, 6]]
>>> nested[4]
[5, 6]
>>> nested[4][0]
5
>>> nested[3:5]
[4, [5, 6]]


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
>>> locations = {(4, 5): "CSM"}
>>> locations[(4, 5)]
'CSM'
>>> locations[[4, 5]]
TypeError
>>> locations[(4, [5])]
TypeError


    new_list = []
    for x in lst:
         for i in range(x):
              new_list = new_list + [x]
    return new_list


def all_primes(nums: list[int]) -> list[int]:
    result = []
    for i in nums:
        if is_prime(i):
            result = result + [i]
    return result

    # Alternative using a list comprehension:
    return [x for x in nums if is_prime(x)]


def gen_list(n: int) -> list[list[int]]:
    return [[i for i in range(j+1)] for j in range(n)]

def gen_increasing(n: int) -> list[list[int]]:
    return [[i for i in range(sum(range(j+1)), sum(range(j+1)) + j+1)] for j in range(n)]
def gen_increasing(n: int) -> list[list[int]]:
    return [[i + sum(range(j + 1)) for i in range(j + 1)] for j in range(n)]


def count_t(word: str) -> int:
    count = 0
    for c in word:
        if c == 't':
            count += 1
    return count
counts: dict[str, int] = {
    word: count_t(word) for word in words
}


def snapshot(
    f: Callable[[int], int], snap_inputs: list[int]
) -> dict[int, int]:
    return {x: f(x) for x in snap_inputs}




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


>>> a = Link(1, Link(2, Link(3)))
>>> a.first
1
>>> a.rest.first
2
>>> a.rest.rest.first
3
>>> a.rest.rest.rest
()
>>> isinstance(a.rest, Link)
True
>>> isinstance(a.rest.rest.rest, Link)
False
>>> a.rest.rest.rest.first
AttributeError: 'tuple' object has no attribute 'first'
>>> a.rest.rest
Link(first=3, rest=())
>>> Link(1, Link(2))
Link(first=1, rest=Link(first=2, rest=()))
>>> print(a)
(1 2 3)


def linkify_rec[T](lst: list[T]) -> LinkedList[T]:
    if not lst:
        return ()
    else:
        return Link(lst[0], linkify_rec(lst[1:]))

def linkify_iter[T](lst: list[T]) -> LinkedList[T]:
    retVal: LinkedList[T] = ()
    for elem in lst[::-1]:
        retVal = Link(elem, retVal)
    return retVal


def combine_two(
    lnk: LinkedList[int], fn: Callable[[int, int], int]
) -> LinkedList[int]:
    if not isinstance(lnk, Link):
        return ()
    elif not isinstance(lnk.rest, Link):
        return Link(lnk.first)
    combined = fn(lnk.first, lnk.rest.first)
    return Link(combined, combine_two(lnk.rest.rest, fn))


def donut(d: int, f: int) -> int:
    if d == 0:
        return 1
    if f == 0:
        return 0
    return donut(d - 1, f) + donut(d, f - 1)


