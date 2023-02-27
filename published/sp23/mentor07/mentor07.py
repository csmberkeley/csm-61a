def pokemon(name, p_type, friends):
    """
    Constructs a Pokemon with the given attributes. 
    >>> cyndaquil = pokemon('Cyndaquil', 'Fire', ['Chikorita', 'Totodile'])
    >>> p_name(cyndaquil)
    'Cyndaquil'
    >>> p_type(cyndaquil)
    'Fire'
    >>> p_friends(cyndaquil)
    ['Chikorita', 'Totodile']
    """
    return [name, p_type, friends]

def p_name(p):
def p_type(p):
def p_friends(p):
def are_friends(p1, p2):
    """
    Returns True iff the Pokemon p1 and p2 are each other's friends.
    """
    return p1[0] in p2[2] and p2[0] in p1[2]
def cross_type_friends(p, pokemon_list): 
    """
    >>> c = pokemon('Charmander', 'Fire', ['Torchic', 'Squirtle', 'Bulbasaur'])
    >>> t = pokemon('Torchic', 'Fire', ['Charmander', 'Squirtle'])
    >>> s = pokemon('Squirtle', 'Water', ['Torchic', 'Bulbasaur'])
    >>> b = pokemon('Bulbasaur', 'Grass', ['Charmander', 'Squirtle'])
    >>> cross_type_friends(c, [t, s, b])
    ['Bulbasaur']
    >>> cross_type_friends(b, [c, s, b])
    ['Charmander', 'Squirtle']
    """
def pokemon(name, p_type, friends):
    """
    >>> lil_guy = pokemon('Pikachu', 'Electric', ['Mewtwo', 'Lucario'])
    >>> p_name(lil_guy)
    'Pikachu'
    >>> p_type(lil_guy)
    'Electric'
    >>> p_friends(lil_guy)
    ['Mewtwo', 'Lucario']
    """
def p_name(p):
    return p('name')
def p_type(p):
    return p('type')
def p_friends(p):
    return p('friends')


def replace_x(t, x):
    """
    >>> t = tree(2, [tree(1), tree(2)])
    >>> replace_x(t, 2)
    tree(0, [tree(1), tree(0)])
    """
    ___________________________________________

    if ________________________________________:

        return ________________________________

    return ________________________________


def contains_n(elem, n, t):
    """
    >>> t1 = tree(1, [tree(1, [tree(2)])])
    >>> contains_n(1, 2, t1)
    True
    >>> contains_n(2, 2, t1)
    False
    >>> contains_n(2, 1, t1)
    True
    >>> t2 = tree(1, [tree(2), tree(1, [tree(1), tree(2)])])
    >>> contains_n(1, 3, t2)
    True
    >>> contains_n(2, 2, t2) # Not on a path
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


