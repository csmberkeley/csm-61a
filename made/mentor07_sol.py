tree('hello',
    [tree('how', []),
     tree('are',
        [tree('you'),
         tree('doing', [])]),
     tree('from', []),
     tree('CSM',
        [tree('61A')])])






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


ghost = [1, 0,[3], 1]
def boo(spooky):
  ghost.append(spooky.append(ghost))
  spooky = spooky[ghost[2][1][1]]
  ghost[:].extend([spooky])
  spooky = [spooky] + [ghost[spooky - 1].pop()] 
  ghost.remove(ghost.remove(1))
  spooky += ["Happy Halloween!"]
  return spooky
pumpkin = boo(ghost[2])


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


>>> next(it)
1
>>> next(it)
2
>>> next(it)
3
>>> next(it)
StopIteration
    for x in "Hello":
        print(x)
    it = iter("Hello")
    while True:
        try: 
            x = next(it)
            print(x)
        except StopIteration:
            pass


>>> a = [1, 2, 3]
>>> x = iter(a)
N/A
>>> next(x)
1
>>> next(x)
2
>>> y = iter(a)
>>> next(y)
1
>>> next(x)
3
>>> next(x)
StopIteration Error
>>> z = iter(y) 
>>> next(z)
2
>>> [next(y), next(y), next(z)]
[2, 3, 3]
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
-1
>>> reduce(lambda x, y: x + y, a)
16


