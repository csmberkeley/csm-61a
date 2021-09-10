"""" SOLUTIONS: CS 61A Tutorial 2 Summer 2021 """

###########
# Control #
###########

"""
1. Write a function that takes in the number of students in two sections and prints out what to do if either
section exceeds 30 students.
"""
def handle_overflow(s1, s2):
	if s1 <= 30 and s2 <= 30:
		print("No overflow")
	elif s2 > 30 and s1 < 30:
		print("Move to Section 1:" + str(30 - s1))
	elif s1 > 30 and s2 < 30:
		print("Move to Section 2:" + str(30 - s2))
	else:
		print("No space left in either section")

"""
2. Implement pow_of_two, which takes in an integer n and prints all the positive, integer powers of two
less than or equal to n. This function should return None.
"""
def pow_of_two(n):
	curr = 1
	while curr <= n:
		print(curr)
		curr *= 2 # equivalent to curr = curr * 2

"""
3. Fill out the function min_fact which calculates the product of consecutive positive numbers starting
from n and working downwards until the first point at which the product becomes greater than margin. 
It should return -1 if there is no product that is greater than margin.
"""
def min_fact(n, margin):
	total, n = n, n - 1
	while total <= margin and n > 0:
		total, n = total * n, n - 1
	if total < margin:
		return -1
	return total


"""
4. Fill out the function digit_div which returns an integer that contains in any order all the digits of k
that divide n evenly. If no such digit of k exists, the function should return 0. Assume that both n and
k are positive integers.
"""
def digit_div (n, k):
	digits = 0
	while k > 0:
		curr_digit = k % 10
		if curr_digit != 0 and n % curr_digit == 0:
			digits = digits * 10 + curr_digit
			k //= 10
	return digits