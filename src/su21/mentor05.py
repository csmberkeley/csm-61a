"""" CS 61A Tutorial 4 Summer 2021 """

#########
# Trees #
#########
"""
2. Write the function sum_of_nodes which takes in a tree and outputs the sum of all
the elements in the tree.
"""
def sum_of_nodes(t):
    """
    >>> t = tree(...) # Tree from question 1.
    >>> sum_of_nodes(t) # 4 + 5 + 2 + 1 + 8 + 2 + 1 + 4 = 27
    27
    """
    # YOUR CODE HERE

"""
3. Write a function, replace_x that takes in a tree, t, and returns a new tree with all
labels x replaced with 0.
"""
def replace_x(t, x):
    # YOUR CODE HERE


"""
4. Write a function, all_paths that takes in a tree, t, and returns a list of paths from
the root to each leaf.
"""
def all_paths(t):
    paths = []
    if ________________________________________
        _______________________________________
    else:
        _______________________________________
            ___________________________________
                _______________________________
    return paths
    

############
# Mutation #
############
"""
2. Given a list of lists lst_of_lsts and some element elem, append elem to every list
in lst_of_lsts.
"""
def append_to_all(lst_of_lsts, elem):
    """
    >>> l = [[1, 0, 5], [2, 6, 4], [8, 3]]
    >>> append_to_all(l, 7)
    >>> l
    [[1, 0, 5, 7], [2, 6, 4, 7], [8, 3, 7]]
    """
    # YOUR CODE HERE


#############
# Challenge #
#############

"""
Given some list lst, possibly a deep list (i.e. lists inside of lists), mutate lst to have
the accumulated sum of all elements so far in the list. If there is a nested list, mutate
it to similarly reflect the accumulated sum of all elements so far in the nested list.
Return the total sum of the original lst.
Hint: The isinstance function returns True for isinstance(l, list) if l is a
list and False otherwise.
"""
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
    return ___________________________________


"""
2. Challenge: Write a function that returns true only if there exists a path from root to
leaf that contains at least n instances of elem in a tree t.
"""
def contains_n(elem, n, t):
    """
    >>> t1 = tree(1, [tree(1, [tree(2)])])
    >>> contains(1, 2, t1)
    True
    >>> contains(2, 2, t1)
    False
    >>> contains(2, 1, t1)
    True
    >>> t2 = tree(1, [tree(2), tree(1, [tree(1), tree(2)])
    ])
    >>> contains(1, 3, t2)
    True
    >>> contains(2, 2, t2) # Not on a path
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