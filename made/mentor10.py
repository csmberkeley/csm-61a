def one(n):
    while n > 0:
       n = n // 2
def two(n):
    for i in range(n):
        for j in range(i):
            print(str(i), str(j))
def three(n):
    i = 1
    while i <= n:
        for j in range(i):
            print(j)
        i *= 2




def double_link(lnk):
    '''Using mutation, replaces the second in each pair of items
    with the first. The first of each pair stays as is.

    >>> double_link(Link(1, Link(2, Link(3, Link(4)))))
    Link(1, Link(1, Link(3, Link(3))))
    >>> double_link(Link('c', Link('s', Link(6, Link(1, Link('a'))))))
    Link('c', Link('c', Link(6, Link(6, Link('a')))))
    '''
    if _____________________________________________________:
        return _____________________________________________
    ________________________________________________________
    ________________________________________________________
    return _________________________________________________


def contains_n(elem, n, t):
    '''
    >>> t1 = Tree(1, [Tree(1, [Tree(2)])])
    >>> contains_n(1, 2, t1)
    True
    >>> contains_n(2, 2, t1)
    False
    >>> contains_n(2, 1, t1)
    True
    >>> t2 = Tree(1, [Tree(2), Tree(1, [Tree(1), Tree(2)])])
    >>> contains_n(1, 3, t2)
    True
    >>> contains_n(2, 2, t2) # Not on a path
    False
    '''
    if n == 0:
		
        return True
				
    elif ___________________________________________:
		
        return _____________________________________
				
    elif ___________________________________________:
		
        return _____________________________________
				
    else:
    
        return _____________________________________


def jerry(jerry):
    def jerome(alex):
        alex.append(jerry[1:])
        return alex
    return jerome
			
ben = ['nice', ['ice']]
jerome = jerry(ben)
alex = jerome(['cream'])
ben[1].append(alex)
ben[1][1][1] = ben
print(ben)


