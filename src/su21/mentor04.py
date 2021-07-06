"""" CS 61A Tutorial 4 Summer 2021 """

#########
# Lists #
#########
"""
3. Write a function that takes in a list nums and returns a new list with only the primes
from nums. Assume that is_prime(n) is defined. You may use a while loop, a for
loop, or a list comprehension.
"""
def all_primes(nums):

###############
# Abstraction #
###############
"""
1. The following is an Abstract Data Type (ADT) for elephants. Each elephant keeps
track of its name, age, and whether or not it can fly. Given our provided constructor,
fill out the selectors:
"""
def elephant(name, age, can_fly):
    """
    Takes in a string name, an int age, and a boolean can_fly.
    Constructs an elephant with these attributes.
    >>> dumbo = elephant("Dumbo", 10, True)
    >>> elephant_name(dumbo)
    "Dumbo"
    >>> elephant_age(dumbo)
    10
    >>> elephant_can_fly(dumbo)
    True
    """
    return [name, age, can_fly]

def elephant_name(e):

def elephant_age(e):

def elephant_can_fly(e):

"""
3. Fill out the following constructor for the given selectors.
"""
def elephant(name, age, can_fly):

def elephant_name(e):
    return e[0][0]

def elephant_age(e):
    return e[0][1]

def elephant_can_fly(e):
    return e[1]

"""
5. (Optional) Fill out the following constructor for the given selectors.
"""
def elephant(name, age, can_fly):
    """
    >>> chris = elephant("Chris Martin", 38, False)
    >>> elephant_name(chris)
    "Chris Martin"
    >>> elephant_age(chris)
    38
    >>> elephant_can_fly(chris)
    False
    >> chris("size")
    "Breaking abstraction barrier!"
    """
    def select(command):



    return select

def elephant_name(e):
    return e("name")

def elephant_age(e):
    return e("age")

def elephant_can_fly(e):
    return e("can_fly")

################
# Dictionaries #
################
"""
1. Write a function replace all that replaces all occurences of x as a value (not a key)
in d with y.
"""
def replace_all(d, x, y):
    """Replace all occurrences of x as a value (not a key) in
    d with y.
    >>> d = {3: '3', 'foo': 2, 'bar': 3, 'garply': 3, 'xyzzy':
    99}
    >>> replace_all(d, 3, 'poof')
    >>> d == {3: '3', 'foo': 2, 'bar': 'poof', 'garply': 'poof
    ', 'xyzzy': 99}
    True
    """

"""
2. Write a function counter that takes in an input string, message, and returns a dictionary that
maps each unique word in message to the number of times it appears.
"""
def counter(message):
    """ Returns a dictionary of each word in message mapped
    to the number of times it appears in the input string.
    >>> x = counter('to be or not to be')
    >>> x['to']
    2
    >>> x['be']
    2
    >>> x['not']
    1
    >>> y = counter('run forrest run')
    >>> y['run']
    2
    >>> y['forrest']
    1
    """
    word_list = message.split() # .split() returns a list of the words in the string. Try printing it!