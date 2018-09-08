def partition_sll(lnk):
    """ Takes in a linked list as an argument. Non-destructively returns
    a linked list composed of three smaller linked lists: elements less than 
    the first element of the original linked list, elements equal to the first element,
    and elements greater than the first element.
    
    >>> lnk = Link(5, Link(2, Link(3, Link(1, Link(4)))))
    >>> partition_sll(lnk)
    Link(Link(4, Link(1, Link(2, Link(3)))), Link(Link.empty, Link(Link.empty)))
    >>> lnk2 = Link(3, Link(4, Link(3, Link(1, Link(4)))))
    >>> partition_sll(lnk2)
    Link(Link(1), Link(Link(3, Link(3)), Link(Link(4, Link(4)))))
    """
    less, equal, greater, pivot = Link.empty, Link.empty, Link.empty, lnk.first
    while lnk is not Link.empty:
        curr = lnk.first
        if curr < pivot:
            less = Link(curr, less)
        elif curr > pivot:
            greater = Link(curr, greater)
        else:
            equal = Link(curr, equal)
        lnk = lnk.rest
    return Link(less, Link(equal, Link(greater)))
