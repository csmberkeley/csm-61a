[1, 2, 3]
>>> a[2]
>>> a[-1]
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




[x ** 2 for x in lst]
sum([x * y for x, y in zip(lst1, lst2)])
a = [[x for x in range(y)] for y in range(1, 6)]
b = [[x for x in range(y) if x != 2] for y in range(1, 6)]


new_list = []
for x in lst:
     for i in range(x):
          new_list = new_list + [x]
return new_list


def snapshot(f, inputs):
    snap = {}
    for input in inputs:
        snap[input] = f(input)
    return snap


def count_digraphs(text, alphabet):
    freq = {}
    for i in range(len(text) - 1):
        if text[i] in alphabet and text[i + 1] in alphabet:
            digraph = text[i] + text[i + 1]
            if digraph in freq:
                freq[digraph] += 1
            else: 
                freq[digraph] = 1
    return freq


