six = [6]
seven = [7]

def six_seven(sixty, seventy):
    def six_or_seven(s):
        if s.pop() == 6:
            return 67
        else:
            return 7
    seven = six_or_seven(sixty)
    sixty.append(seventy.extend(six))
    sixty.append([seven])
    return sixty
    
ss = six_seven(six, seven)
print(ss)


def buffet_possible(options, choice):
    """
    >>> buffet_possible("pvprprrpff", "p")
    True
    >>> buffet_possible("pvprprrvpff", "pvpvp")
    True
    >>> buffet_possible("pvprprrvpff", "fff")
    False
    >>> buffet_possible("pvprprrvpff", "")
    True
    """

    if _________:
        return ___________
    elif ___________:
        return ___________
    else:
        if ___________:
            return ___________
        else:
            return ___________
    


def buffet(options, choice):
    """
    >>> buffet("pvprprrpff", "p")
    [[0], [2], [4], [7]]
    >>> buffet("pvprprrvpff", "rr")
    [[3, 5], [3, 6], [5, 6]]
    >>> buffet("pvprprrvpff", "pvprprrvpff")
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]
    >>> buffet("rrfff", "rrrr") # Not possible
    []
    >>> buffet("rrfff", "") # Not selecting anything
    [[]]
    """

    def helper(options, choice, current_index):
        if __________:
            return [[]]
        if ___________:
            return []
        with_current = ___________
        without_current = ___________
        if ___________:
            return ___________
        else:
            return ___________
    
    return ___________
    


