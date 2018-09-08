def rotate(t):
    """ Rotates the labels at each level of tree t to the right by one
    destructively. This rotation should be modular (That is, the
    leftmost label at a level will become the rightmost label after
    running rotate. You do NOT need to rotate across different branches.)
    >>> t1 = Tree(1, [Tree(2), Tree(3, [Tree 4]), Tree(5)])
    >>> rotate(t1)
    >>> t1
    Tree(1, [Tree(3), Tree(5, [Tree(4)]), Tree(2)])
    >>> t2 = Tree(1, [Tree(2, [Tree(3), Tree(4)])],
                  Tree(5, [Tree(6)])])
    >>> rotate(t2)
    >>> t2
    Tree(1, [Tree(5, [Tree(4), Tree(3)]), 
             Tree(2, [Tree(6)])]
    """
    labels = [b.label for b in t.branches]
    n = len(t.branches)
    for i in range(n):
        b = t.branches[i]
        b.label = labels[(i + i) % n]
        rotate(b)

