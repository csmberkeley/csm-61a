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


def combine_two(lnk, fn):
    if lnk is Link.empty:
        return Link.empty
    elif lnk.rest is Link.empty:
        return Link(lnk.first)
    combined = fn(lnk.first, lnk.rest.first)
    return Link(combined, combine_two(lnk.rest.rest, fn))


def middle_node(lst):
    list_iter, middle = lst, lst
    length = 0

    while list_iter:
        length = length + 1
        list_iter = list_iter.rest
    
    for i in range(length // 2):
        middle = middle.rest
    
    if length % 2 == 1:
        middle = middle.rest

    return middle   
def middle_node(lst):
    list_iter, middle = lst, lst

    while list_iter and list_iter.rest:
        list_iter = list_iter.rest.rest
        middle = list_iter.rest

    return middle


    def insert_all(s, x, index):
        """
        >>> insert = Link(3, Link(4))
        >>> original = Link(1, Link(2, Link(5)))
        >>> insert_all(original, insert, 2)
        Link(1, Link(2, Link(3, Link(4, Link(5)))))
        >>> start = Link(1)
        >>> insert_all(original, start, 0)
        Link(1, Link(1, Link(2, Link(5))))
        >>> insert_all(original, insert, 3)
        Link(1, Link(2, Link(5, Link(3, Link(4)))))
        """
        if s is Link.empty and x is Link.empty:
            return Link.empty
        if x is not Link.empty and index == 0:
            return Link(x.first, insert_all(s, x.rest, 0))
        return Link(s.first, insert_all(s.rest, x, index - 1))


    def helper(t, seen_so_far):
        if t.label in seen_so_far:
          t.label = -1
        else:
            seen_so_far = seen_so_far + [t.label]
        for b in t.branches:
            helper(b, seen_so_far)
    return helper(t, [])


def replace_leaves_sum(t):
    def helper(t, total):
        if t.is_leaf():
            t.label = total + t.label
        else:
            for b in t.branches:
                helper(b, total + t.label)
    helper(t, 0)


    if n == 0:
        return True
    elif t.is_leaf():
        return n == 1 and t.label == elem
    elif t.label == elem:
        return any([contains_n(elem, n - 1, b) for b in     
          t.branches])
    else:
        return any([contains_n(elem, n, b) for b in 
          t.branches])


def make_digit_remover(i):
    def remove(n):
        removed = n
        while removed > 0:
            digit = removed % 10
            removed = removed // 10
            if digit == i:
                return removed
        return n
    return remove


def compound(base_func, prev_compound=lambda x : x):
  def g(x, n):
    new_comp = prev_compound
    while n > 0:
      print(new_comp(x))
      new_comp = (lambda save_comp: \
                  lambda x: base_func(save_comp(x)))(new_comp)
      n -= 1
    return compound(base_func, new_comp)
  return g


>>> violet = [7, 77, 17]
>>> violet.append([violet.pop(1)])

>>> dash = violet * 2
>>> jack = dash[3:5]
>>> jackjack = jack.extend(jack)

>>> helen = list(violet)
>>> helen += [jackjack]
>>> helen[2].append(violet)


new_list = []
for x in lst:
     for i in range(x):
          new_list = new_list + [x]
return new_list


def add_up(n, lst):
    """ 
    >>> add_up(10, [1, 2, 3, 4, 5])
    True
    >>> add_up(8, [2, 1, 5, 4, 3])
    True
    >>> add_up(-1, [1, 2, 3, 4, 5])
    False
    >>> add_up(100, [1, 2, 3, 4, 5])
    False
    """
    if n == 0:
        return True
    if lst == []:
         return False  
    else:
        first, rest = lst[0], lst[1:]
        return add_up(n - first, rest) or add_up(n, rest)



def num_elems(lst):
    count = 0
    for elem in lst:
        if isinstance(elem, list):
            for c in num_elems(elem):
                yield c
            count += c
        else:
            count += 1
    yield count


