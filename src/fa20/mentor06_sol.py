# Lists
# PROBLEM 3
def all_primes(nums):
    result = []
    for i in nums:
        if is_prime(i):
            result = result + [i]
    return result

    """
    List comprehension:
    return [x for x in nums if is_prime(x)]
    """

# Abstraction
# PROBLEM 1
def elephant_name(e):
    return e[0]
def elephant_age(e):
    return e[1]
def elephant_can_fly(e):
    return e[2]

# PROBLEM 3
def elephant(name, age, can_fly):
    return [[name, age], can_fly]
def elephant_name(e):
    return e[0][0]
def elephant_age(e):
    return e[0][1]
def elephant_can_fly(e):
    return e[1]

# (Optional) PROBLEM 5
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
    def select(command)
        if command == "name":
            return name
        elif command == "age":
            return age
        elif command == "can_fly":
            return can_fly
        return "Breaking abstraction barrier!"
    return select
def elephant_name(e):
    return e("name")
def elephant_age(e):
    return e("age")
def elephant_can_fly(e):
    return e("can_fly")

# Trees
# PROBLEM 1
def sum_of_nodes(t):
    total = label(t)
    for branch in branches(t):
        total += sum_of_nodes(branch)
    return total

    """
    Alternative solution:
    return label(t) +
           sum([sum_of_nodes(b) for b in branches(t)])
    """

# Challenge Problems
# PROBLEM 1
def gen_list(n):
    return [[i for i in range(j+1)] for j in range(n)]

def gen_increasing(n):
	return [[i for i in range(sum(range(j+1)), sum(range(j+1)) + j+1)] for j in range(n)]

# PROBLEM 2A
def word_exists(word, t):
    if len(word) == 1:
        return is_leaf(t) and word[0] == label(t)
    if word[0] != label(t):
        return False
    return any([word_exists(word[1:], b) for b in branches(t)])

# PROBLEM 2B
def scrabble_tree(t):
    def find_all_words(t):
        if is_leaf(t):
            return [label(t)]
        all_words = []
        for b in branches(t):
            words_in_branch = find_all_words(b)
            words_from_t = [label(t) + w for w in words_in_branch]
            filter_from_t = list(filter(lambda w: word_exists(w, t), words_from_t))
            all_words = all_words + words_in_branch + filter_from_t
        return all_words
    clean_words = [word for word in find_all_words(t)if is_word(word)]
    return max(clean_words, key=lambda w: score(w))
