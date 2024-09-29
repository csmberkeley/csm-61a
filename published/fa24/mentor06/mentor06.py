>>> a = [1, 2, 3]
>>> a
>>> a[2]
>>> a[-1]
>>> b = a
>>> a = a + [4, [5, 6]]
>>> a
>>> b
>>> c = a
>>> a = [4, 5]
>>> a
>>> c
>>> d = c[3:5]
>>> c[3] = 9
>>> d

>>> c[4][0] = 7
>>> d
>>> c[4] = 10
>>> d
>>> c


L = [1, 2, 3]
B = L
B
A = L[1:3]
L[0] = A
L = L + A
B




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


def snapshot(f, snap_inputs):
    """
    >>> snapshot(lambda x: x**2, [1, 2, 3])
    {1: 1, 2: 4, 3: 9}
    """

    snap = __________________________________________

    __________________________________________:

        __________________________________________
        
    return snap


def count_t(d, word):
    """
    >>> words = {}
    >>> count_t(words, "tatter")
    >>> words["tatter"]
    3
    >>> count_t(words, "tree")
    >>> words
    {'tatter': 3, 'tree': 1}
    """
    _______________________________
    
    for ____________________________:

        if ____________________________:

            __________________________________

    _______________________________



def count_digraphs(text, alphabet):
    """
    >>> count_digraphs("otto", ['o', 't'])
    {'ot': 1, 'tt': 1, 'to': 1}
    >>> count_digraphs("otto", ['t'])
    {'tt': 1}
    >>> count_digraphs("6161 6", ['6', '1'])
    {'61': 2, '16': 1}
    >>> count_digraphs("lalala", ['l', 'a'])
    {'la': 3, 'al': 2}
    """

    freq = {}

    for i in range(len(text) - 1):
        if text[i] in alphabet and text[i + 1] in alphabet:
            digraph = text[i] + text[i + 1]
            if digraph in freq:
                freq[digraph] += 1
            else:
                freq[digraph] = 1

    return freq


