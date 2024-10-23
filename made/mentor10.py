>>> a = Link(1, Link(2, Link(3)))
>>> a.first
>>> a.first = 5
>>> a.first
>>> a.rest.first
>>> a.rest.rest.rest.rest.first
>>> a.rest.rest.rest = a
>>> a.rest.rest.rest.rest.first
>>> repr(Link(1, Link(2, Link(3, Link.empty))))
>>> Link(1, Link(2, Link(3, Link.empty)))
>>> str(Link(1, Link(2, Link(3))))
>>> print(Link(Link(1), Link(2, Link(3))))


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


def middle_node(lst):
    """
    >>> head = Link(1, Link(2, Link(3, Link(4, Link(5)))))
    >>> middle_node(head)
    Link(3, Link(4, Link(5))) # The middle node of the list is node 3
    >>> head = Link(1, Link(2, Link(3, Link(4, Link(5, Link(6))))))
    Link(4, Link(5, Link(6))) # Since the list has two middle nodes with values 3 and 4, we return the second one
    """
    list_iter, middle = _______________, ________________
    
    length = _________________________________

    while _________________________________:

        length = _________________________________

        list_iter = _________________________________
    
    for _________________________________:

        middle = _________________________________
    
    if length % 2 == 1:

        middle = _________________________________

    return middle  

def middle_node(lst):

    list_iter, middle = _______________, ________________

    while ___________________ and ___________________:

        list_iter = _________________________________

        middle = _________________________________

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
        """
        if ___________________ and ___________________:

            ___________________________________________

        if ___________________ and ___________________:

            ___________________________________________

        _______________________________________________
    


def delete_path_duplicates(t):
    """
    >>> t = Tree(1, [Tree(2, [Tree(1), Tree(1)])])
    >>> delete_path_duplicates(t)
    >>> t
    Tree(1, [Tree(2, [Tree(-1), Tree(-1)])])
    >>> t2 = Tree(1, [Tree(2), Tree(2, [Tree(2, [Tree(1, [Tree(5)])])])])
    >>> delete_path_duplicates(t2)
    >>> t2
    Tree(1, [Tree(2), Tree(2, [Tree(-1, [Tree(-1, [Tree(5)])])])])
    """
    def helper(_______________, _______________):

        if ________________________________:

            ________________________________

        else:

            ________________________________

        for _______ in ____________________:

            ________________________________

    ________________________________________



def replace_leaves_sum(t):
    """
    >>> t = Tree(1, [Tree(3, [Tree(2), Tree(8)]), Tree(5)])
    >>> replace_leaves_sum(t)
    >>> t
    Tree(1, [Tree(3, [Tree(6), Tree(12)]), Tree(6)])
    """
    def helper(______________ , _________________):

        if t.is_leaf():

            _____________________________________

        for b in t.branches:

            _________________________________

    _____________________________________________


def flower_keeper(t):
    """
    Mutates the tree T to keep only paths that end in flowers ('V').
    If a path consists entirely of stems ('|'), it must be pruned.
    If T has no paths that end in flowers, the root node is still kept.
    You can assume that a node with a flower will have no branches.
    >>> one_f = Tree('|', [Tree('|', [Tree('|'), Tree('|')]), Tree('|', [Tree('V'), Tree('|')])])
    >>> print(one_f)
    |
        |
            |
            |
        |
            V
            |
    >>> flower_keeper(one_f)
    >>> one_f
    Tree('|', [Tree('|', [Tree('V')])])
    >>> print(one_f)
    |
        |
        V
    >>> no_f = Tree('|', [Tree('|', [Tree('|'), Tree('|')]), Tree('|', [Tree('|'), Tree('|')])])
    >>> flower_keeper(no_f)
    >>> no_f
    Tree('|')
    >>> just_f = Tree('V')
    >>> flower_keeper(just_f)
    >>> just_f
    Tree('V')
    >>> two_f = Tree('|', [Tree('|', [Tree('V')]), Tree('|', [Tree('|'), Tree('V')])])
    >>> flower_keeper(two_f)
    >>> two_f
    Tree('|', [Tree('|', [Tree('V')]), Tree('|', [Tree('V')])])
    """
    for b in __________:

        __________

    __________ = [__________ for b in __________ if __________]


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


bless, up = 3, 5
another = [1, 2, 3, 4]
one = another[1:]

another[bless] = up
another.append(one.remove(2))
another[another[0]] = one
one[another[0]] = another[1]
one = one + [another.pop(3)]
another[1] = one[1][1][0]
one.append([one.pop(1)])


>>> violet = [7, 77, 17]
>>> violet.append([violet.pop(1)])

>>> dash = violet * 2
>>> jack = dash[3:5]
>>> jackjack = jack.extend(jack)

>>> helen = list(violet)
>>> helen += [jackjack]
>>> helen[2].append(violet)


def duplicate_list(lst):
    """
    >>> duplicate_list([1, 2, 3])
    [1, 2, 2, 3, 3, 3]
    >>> duplicate_list([5])
    [5, 5, 5, 5, 5]
    """
    _______________________________
    
    for ____________________________:

         for ____________________________:

              __________________________________

    _______________________________



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
    if __________________________________________:
    
        return True
        
    if lst == []:
    
        ____________________________________________________
        
    else:
    
        first, rest = ___________________, ___________________
        
        return __________________________________________


def num_elems(lst):
    """
    >>> list(num_elems([3, 3, 2, 1]))
    [4]
    >>> list(num_elems([1, 3, 5, [1, [3, 5, [5, 7]]]]))
    [2, 4, 5, 8]
    """

    count = _______________

    for ___________________________:

        if ________________________:

            for _________________________________:

                yield ___________________________

            _______________________________
        else:

            _______________________________

    yield ___________________________


