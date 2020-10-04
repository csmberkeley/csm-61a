# Lists
# PROBLEM 2
def reverse(lst):
    if len(lst) <= 1:
        return lst
    return reverse(lst[1:]) + [lst[0]]

lst = [1, [2, 3], 4]
rev = reverse(lst)

# PROBLEM 3
def all_primes(nums):

# Abstraction
# PROBLEM 1
def elephant(name, age, can_fly):
    """
    Takes in a string name, an int age, and a boolean can_fly.
    Constructs an elephant with these attributes.
    >>> dumbo = elephant("Dumbo", 10, True)
    >>> elephant_name(dumbo)
    "Dumbo"
    >>> elephant_age(dumbo)
    10
    >>> elephant_can_fly(dumbo)
    True
    """
    return [name, age, can_fly]

def elephant_name(e):

def elephant_age(e):

def elephant_can_fly(e):

# PROBLEM 3
def elephant(name, age, can_fly):

def elephant_name(e):
    return e[0][0]
def elephant_age(e):
    return e[0][1]
def elephant_can_fly(e):
    return e[1]

# (Optional) PROBLEM 5
def elephant(name, age, can_fly):
    """
    >>> chris = elephant("Chris Martin", 38, False)
    >>> elephant_name(chris)
    "Chris Martin"
    >>> elephant_age(chris)
    38
    >>> elephant_can_fly(chris)
    False
    >> chris("size")
    "Breaking abstraction barrier!"
    """
    def select(command)





    return select
def elephant_name(e):
    return e("name")
def elephant_age(e):
    return e("age")
def elephant_can_fly(e):
    return e("can_fly")

# Trees
# PROBLEM 1
def sum_of_nodes(t):
    """
    >>> t = tree(...) # Tree from question 1.
    >>> sum_of_nodes(t) # 4 + 5 + 2 + 1 + 8 + 2 + 1 + 4 = 27
    27
    """

# Challenge Problems
# PROBLEM 1
def gen_list(n):
    """
    Returns a nested list structure of n elements where the
    ith element is a list from 0 (inclusive) to i (exclusive).
    >>> gen_list(3)
    [[0], [0, 1], [0, 1, 2]]
    >>> gen_list(5)
    [[0], [0, 1], [0, 1, 2], [0, 1, 2, 3], [0, 1, 2, 3, 4]]
    """
    return _______________________________________________

def gen_increasing(n):
    """
    Returns a nested list structure of n elements where the
    ith element of each list is one more than the previous
    element (even if the previous is in a prior sublist).
    >>> gen_increasing(3)
    [[0], [1, 2], [3, 4, 5]]
    >>> gen_increasing(5)
    [[0], [1, 2], [3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13,
    14]]
    """
    return ______________________________________________

# PROBLEM 2A
def word_exists(word, t):
    if len(word) == 1:
        return _____________________________________
    elif ____________________:
        return False
    return _____(_____________________________________________)

# PROBLEM 2B
"""
>>> lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
>>> evens = list(filter(lambda x: x % 2 == 0, lst))
>>> evens
[2, 4, 6, 8, 10]
"""

def scrabble_tree(t):
    """
    We assume that all characters have a score of 1.

    >>> t1 = tree('h', [tree('j', [tree('i')])])
    >>> scrabble_tree(t1)
    'hi'
    >>> t2 = tree('i', [tree('l', [tree('l')])])
    >>> t3 = tree('h', [tree('i'), t2])
    >>> scrabble_tree(t3)
    'hill'
    """
    def find_all_words(t):
        if _______________:
            return _________________
        all_words = []
        for b in branches(t):
            words_in_branch = _____________________
            words_from_t = [___________________________________]
            filter_from_t = ___________________________________
            all_words = _______________________________________
        return _________________
    clean_words = [____________________________________________]
    return max(_______________, key=_________________________)
