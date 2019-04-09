def maximize_tree(t):
    """ Changes the label of a node to the maximum label found
    in its siblings, if this increases the value of the label of the node.
    If a node has no siblings or the maximum label found in its siblings
    is less than its original label, its label should not change. Assume 
    that all labels are nonnegative integers.
    """
    [maximize_tree(b) for b in t.branches]
    orig = [b.label for b in t.branches]
    for i in range(len(t.branches)):
        ls = []
        for j in range(len(t.branches)):
            if i != j:
                ls.extend([k.label for k in t.branches[j]] + orig[j])
        t.branches[i].label = max(ls)
