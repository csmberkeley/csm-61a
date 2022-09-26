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
    return p[0]
def p_type(p):
    return p[1]
def p_friends(p):
    return p[2]
def are_friends(p1, p2):
    """
    Returns True iff the Pokemon p1 and p2 are each other's friends.
    """
    return p1[0] in p2[2] and p2[0] in p1[2]
def are_friends(p1, p2):
    return p_name(p1) in p_friends(p2) and p_name(p2) in p_friends(p1)
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
    friend_list = []
    for other in pokemon_list:
        if are_friends(p, other) and p_type(p) != p_type(other):
            friend_list += [p_name(other)]
    return friend_list

    # Alternative solution

    return [p_name(o) for o in pokemon_list if are_friends(p, o) and p_type(p) != p_type(o)]
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
    def select(command):
        if command == 'name':
            return name
        elif command == 'type':
            return p_type
        elif command == 'friends':
            return friends
    return select
    return lambda sel: {'name': name, 'type': p_type, 'friends': friends}[sel]
def p_name(p):
    return p('name')
def p_type(p):
    return p('type')
def p_friends(p):
    return p('friends')


def even_square_tree(t):
    branches_s = [even_square_tree(b) for b in branches(t)]
    if label(t) % 2 == 0:
        return tree(label(t) * label(t), branches_s)
    else:
        return tree(label(t), branches_s)


def all_paths(t):
    paths = []
    if is_leaf(t):
        paths += [[label(t)]]
    else:
        for b in branches(t):
            for path in all_paths(b):
                paths += [[label(t)] + path]
    return paths


def contains_n(elem, n, t):
    if n == 0:
        return True
    elif is_leaf(t):
        return n == 1 and label(t) == elem
    elif label(t) == elem:
        return True in [contains_n(elem, n - 1, b) for b in     
          branches(t)]
    else:
        return True in [contains_n(elem, n, b) for b in 
          branches(t)]


