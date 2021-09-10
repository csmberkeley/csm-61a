[1, 2, 3]
>>> a[2]
>>> b = a
>>> a = a + [4, [5, 6]]
>>> a
[1, 2, 3, 4, [5, 6]]
>>> b
[1, 2, 3]
>>> c = a
>>> a = [4, 5]
>>> a
[4, 5]
>>> c
[1, 2, 3, 4, [5, 6]]
>>> d = c[3:5]
>>> c[3] = 9
>>> d

[4, [5, 6]]
>>> c[4][0] = 7
>>> d
[4, [7, 6]]
>>> c[4] = 10
>>> d
[4, [7, 6]]
>>> c
[1, 2, 3, 9, 10]






    result = []
    for i in nums:
        if is_prime(i):
            result = result + [i]
    return result

    List comprehension:
    return [x for x in nums if is_prime(x)]


[x ** 2 for x in lst]
sum([x * y for x, y in zip(lst1, lst2)])
a = [[x for x in range(y)] for y in range(1, 6)]
b = [[x for x in range(y) if x != 2] for y in range(1, 6)]






    return e[0]
def elephant_age(e):
    return e[1]
def elephant_can_fly(e):
    return e[2]
def elephant_roster(elephants):
    """
    Takes in a list of elephants and returns a list of their names.
    """
    return [elephant[0] for elephant in elephants]
def elephant_roster(elephants):
    return [elephant_name(elephant) for elephant in elephants]
def elephant(name, age, can_fly):
    return [[name, age], can_fly]
def elephant_name(e):
    return e[0][0]
def elephant_age(e):
    return e[0][1]
def elephant_can_fly(e):
    return e[1]
def elephant(name, age, can_fly):
    """
    >>> alex = elephant("Alex Kassil", 22, False)
    >>> elephant_name(alex)
    "Alex Kassil"
    >>> elephant_age(alex)
    22
    >>> elephant_can_fly(alex)
    False
    >> alex("size")
    "Breaking abstraction barrier!"
    """
    def select(command):
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


