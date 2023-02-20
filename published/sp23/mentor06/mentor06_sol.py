>>> a = [1, 2, 3]
>>> a
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


L = [1, 2, 3]
B = L
B
A = L[1:3]
L[0] = A
L = L + A
B


[x ** 2 for x in lst]
sum([x * y for x, y in zip(lst1, lst2)])
a = [[x for x in range(y)] for y in range(1, 6)]
b = [[x for x in range(y) if x != 2] for y in range(1, 6)]


def gen_list(n):
    return [[i for i in range(j+1)] for j in range(n)]

def gen_increasing(n):
	return [[i for i in range(sum(range(j+1)), sum(range(j+1)) + j+1)] for j in range(n)]

\textit{An alternate solution for gen_increasing is:}
def gen_increasing(n):
    return [[i + sum(range(j + 1)) for i in range(j + 1)] for j in range(n)]


def snapshot(f, snap_inputs):
    snap = {}
    for snap_input in snap_inputs:
        snap[snap_input] = f(snap_input)
    return snap


count = 0
for c in word:
    if c == 't':
        count += 1
d[word] = count


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


