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
    if lnk is Link.empty or lnk.rest is Link.empty:
        return lnk
    lnk.rest.first = lnk.first
    double_link(lnk.rest.rest)
    return lnk


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


        def fruitOptions(m, pc, ac): 
            if m < pc and m < ac:
                yield ''
            if m >= pc:
                for p in fruitOptions(m-pc, pc, ac):
                    yield 'pear ' + p;
            if m >= ac:
                for a in fruitOptions(m-ac, pc, ac):
                    yield 'apple ' + a;    


