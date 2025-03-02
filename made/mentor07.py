tree('hello',
    [tree('how', []),
     tree('are',
        [tree('you', []),
         tree('doing', [])]),
     tree('from', []),
     tree('CSM',
        [tree('61A', [])])])








def replace_x(t, x):
    """
    >>> t = tree(2, [tree(1), tree(2)])
    >>> replace_x(t, 2)
    tree(0, [tree(1), tree(0)])
    """
    new_branches = []
    for _______ in ____________________________:

        new_branches._____________________________

    if ________________________________________:

        return ________________________________

    return ________________________________


def contains_n(elem, n, t):
    """
    >>> t1 = tree(1, [tree(1, [tree(2)])])
    >>> contains_n(1, 2, t1)
    True
    >>> contains_n(2, 2, t1)
    False
    >>> contains_n(2, 1, t1)
    True
    >>> t2 = tree(1, [tree(2), tree(1, [tree(1), tree(2)])])
    >>> contains_n(1, 3, t2)
    True
    >>> contains_n(2, 2, t2) # Not on a path
    False
    """
    if n == 0:

        return True

    elif ___________________________________________:

        return _____________________________________

    elif label(t) == elem:

        return _____________________________________

    else:

        return _____________________________________


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
    """
    >>> l = [1, 5, 13, 4]
    >>> accumulate(l)
    23
    >>> l
    [1, 6, 19, 23]
    >>> deep_l = [3, 7, [2, 5, 6], 9]
    >>> accumulate(deep_l)
    32
    >>> deep_l
    [3, 10, [2, 7, 13], 32]
    """
    sum_so_far = 0
    for ________________________________________:

	    ________________________________________

        if isinstance(___________________, list):

	    inside = ___________________________

            ____________________________________

        else:
            ____________________________________

            ____________________________________
    
    _________________________________


def scrabbler(chars, words, values):
    """ Given a list of words and point values for letters, returns a
    dictionary mapping each word that can be formed from letters in chars
    to their point value. You may not need all lines
    >>> words = ["easy", "as", "pie"]
    >>> values = {"e": 2, "a": 2, "s": 1, "p": 3, "i": 2, "y": 4}
    >>> scrabbler("heuaiosby", words, values)
    {'easy': 9, 'as': 3}
    >>> scrabbler("piayse", words, values)
    {'pie': 7, 'as': 3}
    """
    result = ____________________________________

    for ___________________________________________:

        if ________________________________________:

            ____________________________________

            ____________________________________
    
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
>>> next(x)
>>> next(x)
>>> y = iter(a)
>>> next(y)
>>> next(x)
>>> next(x)
>>> z = iter(y) [2, 3]
>>> next(z)
>>> [next(y), next(y), next(z)]
>>> a = iter(filter(lambda x: x % 2, map(lambda x: x - 1, range(10))))
>>> next(a)
>>> reduce(lambda x, y: x + y, a)


