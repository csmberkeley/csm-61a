class Inf_Gen:
    """ Creates an iterator that can iterate in either direction over its
    elements for any number of calls to next(). Upon reaching the end of its elements,
    it will loop back to the beginning; likewise, if going backwards, after reaching the
    very first element, it should loop backwards to the last element.

    >>> a = Inf_Gen([2, 4, 6, 8, 10])
    >>> it = a.gen()
    >>> next(it)
    2
    >>> next(it)
    4
    >>> a.rev()
    >>> next(it)
    6
    >>> next(it)
    4
    >>> next(it)
    2
    >>> next(it)
    10
    >>> a.rev()
    >>> next(it)
    8
    >>> next(it)
    10
    >>> next(it)
    2
    """
    def __init__(self, lst):
        self.lst = lst
        self.index = 0
        self.reverse = False

    def gen(self):
        while True:
            temp = self.index
            if self.reverse:
                self.index -= 1
                if self.index == -1:
                    self.index = len(self.lst) - 1
            else:
                self.index += 1
                if self.index == len(self.lst):
                    self.index = 0
            yield self.lst[tmp]

    def rev(self):
        self.reverse = not self.reverse
