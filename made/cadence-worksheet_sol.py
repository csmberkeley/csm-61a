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
    if choice == "":
        return True
    elif options == "":
        return False
    else:
        if options[0] == choice[0]:
            return buffet_possible(options[1:], choice[1:])
        else:
            return buffet_possible(options[1:], choice)


def buffet(options, choice):
    def helper(options, choice, current_index):
        if choice == "":
            return [[]]
        if options == "":
            return []
        with_current = [[current_index] + x for x in helper(options[1:], choice[1:], current_index+1)]
        without_current = helper(options[1:], choice, current_index+1)
        if options[0] == choice[0]:
            return with_current + without_current
        else:
            return without_current    
    
    return helper(options, choice, 0)


