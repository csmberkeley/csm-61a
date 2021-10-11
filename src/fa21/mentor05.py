"""" CS 61A Tutorial 3 Summer 2021 """

#############
# Recursion #
#############

"""
2. Write a function is_sorted that takes in an integer n and returns true if the digits of
that number are nondecreasing from right to left.
"""
def is_sorted(n):
    """
    >>> is_sorted(2)
    True
    >>> is_sorted(22222)
    True
    >>> is_sorted(9876543210)
    True
    >>> is_sorted(9087654321)
    False
    """

"""
3. Fill in collapse, which takes in a non-negative integer n and returns the number
resulting from removing all digits that are equal to an adjacent digit, i.e. the number
has no adjacent digits that are the same.
"""
def collapse(n):
    """
    >>> collapse(12234441)
    12341
    >>> collapse(11200000013333)
    12013
    """
    rest, last = n // 10, n % 10
    if ___________________________________:
        ____________________________________
    elif _________________________________:
        ____________________________________
    else:
        ____________________________________



##################
# Tree Recursion #
##################

"""
1. Mario needs to jump over a series of Piranha plants, represented as a string of 0’s and
1’s. Mario only moves forward and can either step (move forward one space) or jump
(move forward two spaces) from each position. How many different ways can Mario
traverse a level without stepping or jumping into a Piranha plant? Assume that every
level begins with a 1 (where Mario starts) and ends with a 1 (where Mario must end
up).
"""
def mario_number(level):
    """
    Return the number of ways that Mario can traverse the
    level, where Mario can either hop by one digit or two
    digits each turn. A level is defined as being an integer
    with digits where a 1 is something Mario can step on and
    0 is something Mario cannot step on.
    >>> mario_number(10101)
    1
    >>> mario_number(11101)
    2
    >>> mario_number(100101)
    0
    """
    if _______________________:
        ______________________
    elif _____________________:
        ______________________
    else:
        ___________________________________________________

"""
2. In an alternate universe, 61A software is not that good (inconceivable!). Cyrus is in
charge of assigning students to discussion sections, but sections.cs61a.org only knows
how to list sections with either m or n number of students (the two most popular
sizes). Given a total number of students, can Cyrus create sections and not have
any leftover students? Return true if they can, false otherwise.
"""
def has_sum(total, n, m):
    """
    >>> has_sum(1, 3, 5)
    False
    >>> has_sum(5, 3, 5) # 0 * 3 + 1 * 5 = 5
    True
    >>> has_sum(11, 3, 5) # 2 * 3 + 1 * 5 = 11
    True
    >>> has_sum(61, 11, 15) # 61 is a prime number and can
    't be divided!
    False
    """
    if ____________________________________________________:
        return ____________________________________
    elif __________________________________________________:
        return ____________________________________
    return ________________________________________________

"""
3. Realizing the need for improvement, Cyrus has recruited you to help them make 61A
sections more flexible! Cyrus would like discussion sections to have 20 ≤ x ≤ 30
students each, and tutoring sections to have 6 ≤ y ≤ 8 students. Additionally, it’s
okay to have up to upper total slots, as long as we have at least lower amount to
accomodate all students. Is it possible to assign each student a section? (Note: In
this alternate universe, students can choose either a tutoring section or a discussion
section, but not both.)
"""
def sum_range(lower, upper):
    """
    >>> sum_range(25, 30) # Everyone can go into one
    discussion section
    True
    >>> sum_range(9, 10) # If we make a tutoring section,
    there will be 1-4 extra students
    False
    >>> sum_range(56, 64) # 2 discussion sections, 2
    discussions 1 tutoring section, etc. all work
    True
    """
    def discussions(pmin, pmax):
        if ________________________________________________:
            return ____________________________________
        elif ______________________________________________:
            return ____________________________________
        return ____________________________________________
    return discussions(0, 0)