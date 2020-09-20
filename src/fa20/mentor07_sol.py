>>> a = [1, 2]
>>> b = a
>>> print(a.append([3, 4]))
None
>>> a
[1, 2, [3, 4]]
>>> b
[1, 2, [3, 4]]
>>> c = a[:]
>>> a[0] = 5
>>> a[2][0] = 6
>>> c
[1, 2, [6, 4]]
>>> a.extend([7, 8])
>>> a += [9]
>>> a += 10
TypeError: 'int' object is not iterable
>>> a
[5, 2, [6, 4], 7, 8, 9]
>>> print(c.pop(), c)
[6, 4] [1, 2]






def accumulate(lst):
    sum_so_far = 0
    for i in range(len(lst)):
        item = lst[i]
        if isinstance(item, list):
            inside = accumulate(item)
            sum_so_far += inside
        else:
            sum_so_far += item
            lst[i] = sum_so_far
    return sum_so_far


