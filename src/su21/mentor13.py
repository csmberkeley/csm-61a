"""" CS 61A Tutorial 13 Summer 2021 """


########################
# ENVIRONMENT DIAGRAMS #
########################
"""
1. 2 Chainz accidentally scrambled his chains! Now there’s just one long link that reads
”CANHI.” Fill in each blank in the code example below so that its environment diagram is the following.
"""
a = Link("C", Link("A", Link("N", Link("H", Link("I")))))
b = __________________________________________________
a.rest = b.rest.rest
a.___________________________________________ = b.rest
b.rest = _____________________________________________
a.rest.rest = ________________________________________
b.rest.rest.rest = ____________________________________

#######
# OOP #
#######
"""
1. The DLList class is a spin off of the normal Link class we learned in class; each
DLList link has a prev attribute that keeps track of the previous link and a next
attribute that keeps track of the next link. Fill in the following methods for the DLList
class.
"""
class DLList:
  """
  >>> lst = DLList(6, DLList(1))
  >>> lst.value
  6
  >>> lst.next.value
  1
  >>> lst.prev.value
  AttributeError: 'NoneType' object has no attribute 'value'
  """
  empty = None
  def __init__(self, value, next=empty, prev=empty):

    ________________________________

    ________________________________

    ________________________________

  def add_last(self, value):
    """
    >>> lst = DLList(6)
    >>> lst.add_last(1)
    >>> lst.value
    6
    >>> lst.next.value
    1
    >>> lst.next.prev.value
    6
    """
    pointer = self
    while ________________________________:
        _____________________________________
    _______________ = DLList(____________________________)

  def add_first(self, value):
    """
    >>> lst = DLList('A')
    >>> lst.add_first(1)
    >>> lst.value
    1
    >>> lst.next.value
    'A'
    >>> lst.next.prev.value
    1
    >>> lst.add_first(6)
    >>> lst.value
    6
    >>> lst.next.next.prev.value
    1
    """
    old_first = DLList(____________________________)
    _______________ = _______________________________
    _______________ = _______________________________
    if ______________________________:
        _______________________________________________

#########
# TREES #
#########
"""
1. Implement rotate, which takes in a tree and rotates the labels at each level of the
tree by one to the left destructively. This rotation should be modular (That is, the
leftmost label at a level will become the rightmost label after running rotate). You do
NOT need to rotate across different branches.
"""

def rotate(t):
  """
  >>> t1 = Tree(1, [Tree(2), Tree(3, [Tree(4)]), Tree(5)])
  >>> rotate(t1)
  >>> t1
  Tree(1, [Tree(3), Tree(5, [Tree(4)]), Tree(2)])
  >>> t2 = Tree(1, [Tree(2, [Tree(3), Tree(4)]), 
                    Tree(5, [Tree(6)])])
  >>> rotate(t2)
  >>> t2
  Tree(1, [Tree(5, [Tree(4), Tree(3)]), 
                    Tree(2, [Tree(6)])])
  """
  branch_labels = ___________________________________

  n = len(t.branches)

  for ______________________________________:

    ______________________________________________

    ______________________________________________
    
    ______________________________________________ 

"""
2. Write a generator that takes in a tree and yields each possible path from root to leaf,
represented as a list of the values in that path.
"""
def all_paths(t):
    """
    >>> t = Tree(1, [Tree(2, [Tree(5)]), Tree(3, [Tree(4), Tree(6)]), Tree(7)])
    >>> print(list(all_paths(t)))
        [[1, 2, 5], [1, 3, 4], [1, 3, 6], [1, 7]]
    """    
    if _________________________:

        _________________________

    else:

        for _____________________________:

            for _____________________________:

                ______________________________

##################
# TREE RECURSION #
##################
"""
1. Define all_sums, a generator that iterates through all the sums that can be formed
by adding the elements in lst.
"""
def all_sums(lst):
    """
    >>> list(all_sums([]))
    [0]                      #sum nothing
    >>> list(all_sums([1, 2]))
    [3, 2, 1, 0]             #1 + 2, 2, 1, 0
    >>> list(all_sums([1, 2, 3]))
    [6, 5, 4, 3, 3, 2, 1, 0] #repeat sums are ok! (3 and 2+1)
    """

"""
2. Fill in combine_to_61, which takes in a list of positive integers and returns True if a
contiguous sublist (i.e. a sublist of adjacent elements) combine to 61. You can combine
two adjacent elements by either summing them or multiplying them together. If there
is no combination of summing and multiplying that equals 61, return False.
"""
def combine_to_61(lst):
    """
    >>> combine_to_61([3, 4, 5])
    False # no combination will produce 61
    >>> combine_to_61([2, 6, 10, 1, 3])
    True # 61 = 6 * 10 + 1
    >>> combine_to_61([2, 6, 3, 10, 1])
    False # elements must be contiguous
    """

    def helper(lst, num_so_far):

        if _______________________________:
            return True

        elif _____________________________:
            return False

        with_sum = _________________________ and \

            helper(________________, __________________)

        with_mul = _________________________ and \

            helper(________________, __________________)
        return with_sum or with_mul

    return _____________________________

################
# LINKED LISTS #
################
"""
1. Complete the implementation of iter_link, which takes in a linked list and returns
a generator which will iterate over the values of the linked list in order. Your function
should support deep linked lists.
"""
def iter_link(lnk):
  """ 
  Yield the values of a linked list in order; your function should support deep linked lists.
  >>> lst1 = Link(1, Link(2, Link(3, Link(4))))
  >>> list(iter_link(lst1))
  [1, 2, 3, 4]
  >>> lst2 = Link(1, Link(Link(2, Link(3)), Link(4, Link(5))))
  >>> print(lst2)
  <1 <2 3> 4 5>
  >>> iter_lst2 = iter_link(lst2)
  >>> next(iter_lst2)
  1
  >>> next(iter_lst2)
  2
  >>> next(iter_lst2) 
  3
  >>> next(iter_lst2)
  4
  """
  if lnk is not Link.empty:

    if type(_____________________) is Link:

      _____________________________________
    else:

      _____________________________________

    _______________________________________

"""
2. Write a function combine_two, which takes in a linked list of integers lnk and a
two-argument function fn. It returns a new linked list where every two elements of
lnk have been combined using fn.
"""
def combine_two(lnk, fn):
    """
    >>> lnk1 = Link(1, Link(2, Link(3, Link(4))))
    >>> combine_two(lnk1, add)
    Link(3, Link(7))
    >>> lnk2 = Link(2, Link(4, Link(6)))
    >>> combine_two(lnk2, mul)
    Link(8, Link(6))
    """
    if ______________________________________:

        return ______________________________

    elif ____________________________________

        return ______________________________

    combined = ______________________________

    return __________________________________

#######
# HOF #
#######
"""
1. Write a function, make_digit_remover, which takes in an integer from 0-9, i. It
returns another function which takes in an integer, and removes all digits from right
to left up to and including the first occurance of i. If i does not occur in the integer,
this function returns the original number.
"""
def make_digit_remover(i):
    """
    >>> remove_two = make_digit_remover(2)
    >>> remove_two(232018)
    23
    >>> remove_two(23)
    0
    >>> remove_two(99)
    99
    """
    def remove(_______):

    	removed = _______________________

        while _______________________ > 0:

            _____________________________

            removed = removed // 10

            if __________________________:

                _________________________

        return __________________________

    return __________________________

"""
2. Write a function, curry forever, which takes in a two-argument function, f, and an
integer, arg num. It returns another function that allows us to enter arg num amount
of numbers into f one by one.
"""
def curry_forever (f, arg_num, base=0):
    """
    >>> g = curry_forever(add, 4)
    >>> g(1)(2)(3)(4) # 1 + 2 + 3 + 4
    10 
    """

    def helper(arg_num, amt):
    
   	 if arg_num == 0:
   	 
   	    _________________________________________________
   	    
   	 return __________________________________________
   	 
    ____________________________________________________