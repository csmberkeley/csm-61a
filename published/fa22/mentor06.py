>>> a = [1, 2, 3]
>>> a


def reverse(lst):
    if len(lst) <= 1:
        return lst
    return reverse(lst[1:]) + [lst[0]]

lst = [1, [2, 3], 4]
rev = reverse(lst)




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



def snapshot(f, inputs):
    """
    >>> snapshot(lambda x: x**2, [1, 2, 3])
    {1: 1, 2: 4, 3: 9}
    """

    snap = __________________________________________

    __________________________________________:

        __________________________________________
        
    return snap


def count_digraphs(text, alphabet):
    """
    >>> count_digraphs("otto", ['o', 't'])
    {'ot': 1, 'tt': 1, 'to': 1}
    >>> count_digraphs("otto", ['t'])
    {'tt': 1}
    >>> count_digraphs("6161 6", ['6', '1'])
    {'61': 2, '16': 1}
    """

    freq = {}

    _____________________________________________________:

        if ________________________________________________:

            digraph = __________________________________

            __________________________________________

                __________________________________________

            __________________________________________

                __________________________________________

    return freq


