"""" CS 61A Tutorial 7 Summer 2021 """

#######
# OOP #
#######
"""
2. Let’s build a Bear using OOP!
Bear instances should have an attribute name that holds the name of the bear. The
Bear class should have an attribute bears, a list that stores the name of each bear.
"""
class Bear:
    """
    >>> oski = Bear('Oski')
    >>> oski.name
    'Oski'
    >>> Bear.bears
    ['Oski']
    >>> winnie = Bear('Winnie')
    >>> Bear.bears
    ['Oski', 'Winnie']
    """
    # YOUR CODE HERE

"""
3. Let’s use OOP to help us implement our good friend, the ping-pong sequence!
As a reminder, the ping-pong sequence counts up starting from 1 and is always either
counting up or counting down.
At element k, the direction switches if k is a multiple of 8 or contains the digit 8.
The first 30 elements of the ping-pong sequence are listed below, with direction swaps
marked using brackets at the 8th, 16th, 18th, 24th, and 28th elements:
1 2 3 4 5 6 7 [8] 7 6 5 4 3 2 1 [0] 1 [2] 1 0 -1 -2 -3 [-4] -3 -2 -1 [0] -1 -2
Assume you have a function has_eight(k) that returns True if k contains the digit 8.
"""
class PingPongTracker:
    """
    >>> tracker1 = PingPongTracker()
    >>> tracker2 = PingPongTracker()
    >>> tracker1.next()
    1
    >>> tracker1.next()
    2
    >>> tracker2.next()
    1
    """
    def __init__(self):




    def next(self):


    

###############
# Inheritance #
###############
"""
2. Write TeamBaller, a subclass of Baller. An instance of TeamBaller cheers on the
team every time it passes a ball.
"""
class TeamBaller(_______________):
    """
    >>> caitlin = BallHog('Caitlin')
    >>> cheerballer = TeamBaller('Peter', has_ball=True)
    >>> cheerballer.pass_ball(caitlin)
    Yay!
    True
    >>> cheerballer.pass_ball(caitlin)
    I don't have the ball
    False
    """
    def pass_ball(_______________, ________________):





##########################
# Iterators & Generators #
##########################

"""
1. Write a generator that will take in two iterators and compares the first element of each
iterator and yields the smaller of the two values.
"""
def interleave(iter1, iter2):
    """
    >>> gen = interleave(iter([1, 3, 5, 7, 9]),
    iter([2, 4, 6, 8, 10]))
    >>> for elem in gen:
    ... print(elem)
    ...
    1
    2
    3
    4
    5
    6
    7
    8
    9
    """


"""
2. (a) Implement n_apply, which takes in 3 inputs f, n, x, and outputs the result of
applying f, a function, n times to x. For example, for n = 3, output the result of
f(f(f(x))).
"""
def n_apply(f, n, x):
    """
    >>> n_apply(lambda x: x + 1, 3, 2)
    5
    """
    for __________________________:
    x = ________________________
    return _______________________

"""
2. (b) Now implement list_gen, which takes in some list of integers lst and a function
f. For the element at index i of lst, list gen should apply f to the element i
times and yield this value lst[i] times. You may use n apply from the previous part.
"""
def list_gen(lst, f):
    """
    >>> a = list_gen([1, 2, 3], lambda x: x + 1)
    >>> list(a)
    [1, 3, 3, 5, 5, 5]
    """
    for __________________________:
        yield from [_______________________________________]

"""
3. Define filter_gen, a generator that takes in iterable s and one-argument function
f and yields every value from s for which f returns a truthy value.
"""
def filter_gen(s, f):
    """
    >>> list(filter_gen([1, 2, 3, 4, 5],
    lambda x: x % 2 == 0))
    [2, 4]
    >>> list(filter_gen((1, 2, 3, 4, 5), lambda x: x < 3))
    [1, 2]
    """

"""
4. Write a generator function in_order that takes in a possibly nested list of integers
lst and yields its integer elements in ascending order as a single non-nested list. You
may find the built-in sorted function useful, which takes in a list of integers and
returns a sorted list.
"""
def in_order(lst):
    """
    >>> l1 = [[3, 4, 2], [1, 7, 4]]
    >>> list(in_order(l1))
    [1, 2, 3, 4, 4, 7]
    >>> l2 = [2, [3], [1, [8], 4]]
    >>> list(in_order(l2))
    [1, 2, 3, 4, 8]
    """
    order = []
    for __________________________:
        if ____________________________:
            ___________________________________
        else:
            ___________________________________
    ____________________________________