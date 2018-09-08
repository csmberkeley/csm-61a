def minimize_tree(t):
    """ Takes in a tree t and changes each node to have the smallest value
    found from that node downwards. That is, for every node n in t, n's label 
    should be the smallest number in the subtree rooted at n.
    """
    [minimize_tree(b) for b in t.branches]
    t.label = min([label(b) for b in t.branches] + [t.label])
