

def factorial(n):
    return n * factorial(n)


def sum_prime_digits(n):
    """
    >>> sum_prime_digits(12345)
    10 # 2 + 3 + 5
    >>> sum_prime_digits(4681029)
    2 # 2 is the only prime number
    """
    if ____________________________________________:		

        return ____________________________________	

    if ________________________________________:		

        return ________________________________				

    return ____________________________________
				


def num_digits(n):
    """Takes in an positive integer and returns the number of
    digits.

    >>> num_digits(0)
    1
    >>> num_digits(1)
    1
    >>> num_digits(7)
    1
    >>> num_digits(1093)
    4
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


def positionizer(n):
   """
   >>> positionizer(12)
   10
   >>> positionizer(23)
   20
   >>> positionizer(12345)
   12300
   """
   def helper(n, pos):

      if _____________________________________:

        return ________________________________

      rest = __________________________________
      if n % 10 == pos:

        return rest + _________________________
      else:

        return rest + _________________________

   return helper(______________, ______________)
def max_positionizer(k, lst):
  """
  >>> max_positionizer(2, [1, 2, 3]) # positionized version 
                                     # of 12, 13, 23 are 
                                     # 10, 10, 20 
  23
  >>> max_positionizer(3, [2, 5, 3, 1])
  251
  """
  def make_nums(k,lst):

    if ________________________________:

      return _______________________________

    elif ______________________________:
      return []

    a =  [_____________________________ \
    
              for rest in __________________________]

    b = _______________________________________
    return a + b

  return _______(make_nums(____, ____), ____________)




def gib(n):
    """
    >>> gib(0)
    0
    >>> gib(1)
    1
    >>> gib(2)
    2
    >>> gib(3) # gib(2) + gib(1) + gib(0) = 3
    3
    >>> gib(4) # gib(3) + gib(2) + gib(1) = 6
    6
    """
    if ______________________________:

        return ______________________________
        
    return ______________________________


def mario_number(level):
    """
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


def make_change(n):
    """
    >>> make_change(5) # 5 = 4 + 1 (not 3 + 1 + 1)
    2
    >>> make_change(6) # 6 = 3 + 3 (not 4 + 1 + 1)
    2
    """

    if _____________________:
        return 0

    elif ___________________:

        ___________________________________

    elif ___________________:

        ___________________________________
    else:

        ___________________________________


def modular_exponentiation(base, exponent, modulus):
    """
    >>> modular_exponentiation(2, 2, 2)
    0
    >>> modular_exponentiation(4, 2, 3)
    1
    """
    if _____________________:

        return ____________________________________

    if _____________________:
            
        half_power = ____________________________________
        # Hint: Which math formula above has exponent *just* divided by half?

        return ____________________________________ % modulus

    else:  

        half_power = ____________________________________

        return _________________________________________ % modulus


    def fit_sections(total, n, m):
        """
        >>> fit_sections(1, 3, 5)
        False
        >>> fit_sections(5, 3, 5) # 0 * 3 + 1 * 5 = 5
        True
        >>> fit_sections(11, 3, 5) # 2 * 3 + 1 * 5 = 11
        True
        >>> fit_sections(61, 11, 15) # can't express 61 as a * 11 + b * 15
        False
        """
        if _______________________________________________:
    
            return True
    
        elif __________________________________________________:
    
            return False
    
        return ___________________________________________
    


