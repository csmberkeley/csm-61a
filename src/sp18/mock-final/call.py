class A:
    a = 5
    def __init__(self, lst, n):
        a = 1
        self.lst = lst
        self.n = n
    def update(self):
        for i in range(len(self.lst)):
            self.lst[i] = self.lst[i] * self.n
        self.a += 1
        print(self.a)

class A2(A):
    a = 3
    def update(self):
        for i in range(len(self.lst)):
            self.lst[i] = self.lst[i] - self.m
        self.a -= 1
        print(self.a)

class B:
    def __init__(self, a):
        self.a = a

c = [3, 5, 6]
a = A(c, 2)
b = A2(c, 3)
c = b
