"""" CS 61A Tutorial 2 Summer 2021 """

###########################
# HOF: Lambda Expressions #
###########################

"""
1. Write a higher-order function that passes the following doctests.
Challenge: Write the function body in one line.
"""
def mystery(f, x):
    ## YOUR CODE HERE ##

"""
3. Fill in the blanks (without using any numbers in the first blank) such that the entire expression evaluates to 9.
"""
(lambda x: lambda y: ________________)(_____)(lambda z: z*z)()


#######################
# HOF: Self Reference #
#######################

"""
1. Write a function, print sum, that takes in a positive integer, a, and returns a function that does the
following:
(1) takes in a positive integer, b
(2) prints the sum of all natural numbers from 1 to a*b
(3) returns a higher-order function that, when called, prints the sum of all natural numbers from 1 to (a+b)*c,
    where c is another positive integer.
"""
def print_sum(a):
    def helper(b):
        i, total = ____________________________
        while ____________________________:
            ____________________________
            ____________________________
        print(____________________________)
        return _____________________________
    return _______________________________