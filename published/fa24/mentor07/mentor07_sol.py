tree(4,
    [tree(5, []),
     tree(2,
        [tree(2, []),
         tree(1, [])]),
     tree(1, []),
     tree(8,
        [tree(4, [])])])






def prune(t, k):
    if k == 0:
        return tree(label(t))
    else:
        return tree(label(t), [prune(b, k - 1) for b in branches(t)])


def replace_x(t, x):
    new_branches = []
    for b in branches(t):
        new_branches.append(replace_x(b, x))
    if label(t) == x:
        return tree(0, new_branches)
    return tree(label(t), new_branches)
def replace_x(t, x):
   new_branches = [replace_x(b, x) for b in branches(t)]
   if label(t) == x:
        return tree(0, new_branches)
   return tree(label(t), new_branches)


def contains_n(elem, n, t):
    if n == 0:
        return True
    elif is_leaf(t):
        return n == 1 and label(t) == elem
    elif label(t) == elem:
        return True in [contains_n(elem, n - 1, b) for b in     
          branches(t)]
    else:
        return True in [contains_n(elem, n, b) for b in 
          branches(t)]


>>> a = [1, 2]
>>> a.append([3, 4])
>>> a
[1, 2, [3, 4]]
>>> b = list(a)
>>> a[0] = 5
>>> a[2][0] = 6
>>> b
[1, 2, [6, 4]]
>>> a.extend([7])
>>> a += [8]
>>> a += 9
TypeError: 'int' object is not iterable
>>> a
[5, 2, [6, 4], 7, 8]
>>> b[2][1] = a[2:]
>>> a[2][1][0][0]
6


def accumulate(lst):
    sum_so_far = 0
    for i in range(len(lst)):
        item = lst[i]
        if isinstance(item, list):
            inside = accumulate(item)
            sum_so_far += inside
        else:
            sum_so_far += item
            lst[i] = sum_so_far
    return sum_so_far


    def scrabbler(chars, words, values):
        result = {}
        for w in words:
            if is_subseq(w, chars):
                total = sum([values[c] for c in w])
                result[w] = total
        return result


def foo():
    a = 0
    if a == 0:
        print("Hello")
        yield a
        print("World")

>>> foo()
<generator object>
>>> foo_gen = foo()
>>> next(foo_gen)
Hello
0
>>> next(foo_gen)
World
StopIteration
>>> for i in foo():
...   print(i)
Hello
0
World
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
-1
>>> reduce(lambda x, y: x + y, a)
16


def all_sums(lst):
    """
    >>> list(all_sums([]))
    [0] 
    >>> list(all_sums([1, 2]))
    [3, 2, 1, 0]
    >>> list(all_sums([1, 2, 3]))
    [6, 5, 4, 3, 3, 2, 1, 0]
    >>> list(all_sums([1, 2, 7]))
    [10, 9, 8, 7, 3, 2, 1, 0]
    """
    if len(lst) == 0:
        yield 0
    else:
        for sum_rest in all_sums(lst[1:]):
            yield sum_rest + lst[0]
            yield sum_rest


