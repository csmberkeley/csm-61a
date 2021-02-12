

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


def collapse(n):
    left, last = n // 10, n % 10
    if left == 0:
        return last
    elif last == left % 10:
        return collapse(left)
    else:
        return collapse(left) * 10 + last


def make_change(n):
    if n == 0:
        return 0
    elif n < 3:
        return 1 + make_change(n - 1)
    elif n < 4:
        return 1 + min(make_change(n - 1), make_change(n - 3))
    else:
        return 1 + min(make_change(n - 1), make_change(n - 3), make_change(n - 4))


def max_subset_sum(lst, n):
    if n == 0:
        return 0
    elif len(lst) <= n:
        return sum(lst)
    with_elem = max_subset_sum(lst[1:], n - 1) + lst[0]
    without_elem = max_subset_sum(lst[1:], n)
    return max(with_elem, without_elem)


