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


def combine(n, f, result):
    """
    Combine the digits in non-negative integer n using f.
    
    >>> combine(3, mul, 2) # mul(3, 2)
    6
    >>> combine(43, mul, 2) # mul(4, mul(3, 2))
    24
    >>> combine(6502, add, 3) # add(6, add(5, add(0, add(2, 3))))
    16
    >>> combine(239, pow, 0) # pow(2, pow(3, pow(9, 0))))
    8
    """
    if n == 0:
        return result
    else:
        return combine(_______ , _______ , 
				               
                       __________________________)


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


def has_sum(total, n, m):
    """
    >>> has_sum(1, 3, 5)
    False
    >>> has_sum(5, 3, 5) # 0 * 3 + 1 * 5 = 5
    True
    >>> has_sum(11, 3, 5) # 2 * 3 + 1 * 5 = 11
    True
    """
    if ____________________________________________________:
		
        return ____________________________________
				
    elif __________________________________________________:
		
        return ____________________________________
				
    return ________________________________________________
    


def sum_range(lower, upper):
    """
    >>> sum_range(45, 60) # Printer 1 prints within this range
    True
    >>> sum_range(40, 55) # Printer 1 can print a number 50-60
    False
    >>> sum_range(170, 201) # Printer 1 + 2 will print between 180 and 200 copies total
    True
    """
    def copies(pmin, pmax):
        if ________________________________________________:
				
            return ____________________________________
						
        elif ______________________________________________:
				
            return ____________________________________
						
        return ____________________________________________
				
    return copies(0, 0)
    


