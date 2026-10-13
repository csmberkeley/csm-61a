

SELECT species FROM fish ORDER BY pop DESC LIMIT 3;


SELECT COUNT(species), SUM(pop) FROM fish;


SELECT species, price, MAX(pieces) FROM fish GROUP BY price;


SELECT fish.species, (fish.price - competitor.price) * pieces
    FROM fish, competitor
    WHERE fish.species = competitor.species;








SELECT color, count(g.day) AS cnt
    FROM outfits AS o, grades AS g
    WHERE o.day = g.day
    GROUP BY color
    ORDER BY cnt DESC
    LIMIT 1;


SELECT SUM(score), class
    FROM grades GROUP BY class
    HAVING MIN(score) < 80 ORDER BY SUM(score) DESC;


fruit = [1, 2, [3, 4]]
fruit.append(fruit)
fruit[3][2].append([5, 6])
fruit[2][2].append(fruit[2])
fruit[3][3][2][2][2][1] = 4


def root_to_leaf(t):
    if t.is_leaf():
        yield [t.label]
    for b in t.branches:
        if t.label <= b.label:
            for path in root_to_leaf(b):
                yield [t.label] + path
def subpaths(t):
    yield from root_to_leaf(t)
    for b in t.branches:
        yield from subpaths(b)
  def all_paths(t):
      if t.is_leaf():
          return [[t.label]]
      paths = []
      for b in t.branches:
          for path in all_paths(b):
              paths.append([t.label] + path)
      return paths


    if len(bookshelf['books']) == bookshelf['size']:
        print('Bookshelf is full!')
    else:
        if author in bookshelf['books']:
            bookshelf['books'][author].append(title)
        else:
            bookshelf['books'][author] = [title]
        return list(bookshelf['books'].keys())
        return max(get_all_authors(bookshelf), key=lambda x: len(get_author_books(x))


def hiii(m):
    word = "h"
    for i in range(m):
        word += "i"
    return word

def hiya(n):
    i = 1
    while i < n:
        print(hiii(i))
        i *= 2


"""
>>> p = Plant()
>>> p.height
1
>>> p.materials
[]
>>> p.absorb()
>>> p.materials
[|Sugar|]
>>> Sugar.sugars_created
1
>>> p.leaf.sugars_used
0
>>> p.grow()
>>> p.materials
[]
>>> p.height
2
>>> p.leaf.sugars_used
1
"""
class Plant:
    def __init__(self):
        """A Plant has a Leaf, a list of sugars created so far,
        and an initial height of 1.
        """





    def absorb(self):
        """Calls the Leaf to create sugar."""






    def grow(self):
        """A Plant consumes all of its sugars to grow, each of which
        increases its height by 1.
        """






class Leaf:
    def __init__(self, plant): # plant is a Plant instance
        """A Leaf is initially alive, and keeps track of how many
        sugars it has created.
        """



    def absorb(self):
        """If this Leaf is alive, a Sugar is added to the plant's
        list of sugars.
        """
        if self.alive:


    def __repr__(self):
        return '|Leaf|'

class Sugar:
    sugars_created = 0

    def __init__(self, leaf, plant):



    def activate(self):
        """A sugar is used."""




    def __repr__(self):
        return '|Sugar|'
class Plant:
    def __init__(self):
        """A Plant has a Leaf, a list of sugars created so far,
        and an initial height of 1.
        """
        self.leaf = Leaf(self)
        self.materials = []
        self.height = 1

    def absorb(self):
        """Calls the Leaf to create sugar."""
        self.leaf.absorb()

    def grow(self):
        """A Plant consumes all of its sugars to grow, each of which
        increases its height by 1.
        """
        for sugar in self.materials:
            sugar.activate()
            self.height += 1

class Leaf:
    def __init__(self, plant): # plant is a Plant instance
        """A Leaf is initially alive, and keeps track of how many
        sugars it has created.
        """
        self.alive = True
        self.sugars_used = 0
        self.plant = plant

    def absorb(self):
        """If this Leaf is alive, a Sugar is added to the plant's
        list of sugars.
        """
        if self.alive:
            self.plant.materials.append(Sugar(self, self.plant))


    def __repr__(self):
        return '|Leaf|'

class Sugar:
    sugars_created = 0

    def __init__(self, leaf, plant):
        self.leaf = leaf
        self.plant = plant
        Sugar.sugars_created += 1

    def activate(self):
        """A sugar is used."""
        self.leaf.sugars_used += 1
        self.plant.materials.remove(self)

    def __repr__(self):
        return '|Sugar|'


def rotate(t):
  branch_labels = [b.label for b in t.branches]
  n = len(t.branches)
  for i in range(n):
    branch = t.branches[i]
    branch.label = branch_labels[(i + 1) % n]
    rotate(branch)


(define (collision lst)
  (cond ((null? lst) nil)
    ((list? (car lst))
      (cons (collision (car lst)) (collision (cdr lst))))
    ((and (equal? (car lst) 0) (not (null? (cdr lst))))
      (cons (list (car (cdr lst)) (car lst))
        (collision (cdr (cdr lst)))))
    (else(cons (car lst) (collision (cdr lst))))
  )
)

#Alternate solution (No cond form)

(define (collision lst)
  (if (null? lst)
    lst
    (if (list? (car lst))
      (cons (collision (car lst)) (collision (cdr lst)))
      (if (equal? (car lst) 0)
        (cons (list (cadr list) (car lst)) (collision (cddr lst)))
        (cons (car lst) (collision (cdr lst)))
      )
    )
  )
)


(define (skip-list lst filter-fn) 
  (define (skip-list-tail lst lst-so-far next)
    (cond
      ((null? lst) (if (null? next) 
                    lst-so-far
                    (skip-list-tail (car next) lst-so-far (cdr next))))
      ((pair? (car lst)) 
        (skip-list-tail (car lst) 
                        lst-so-far 
                        (cons (cdr lst) next)))
      ((filter-fn (car lst)) 
        (skip-list-tail (cdr lst) 
                       (append lst-so-far (list (car lst))) 
                       next))
      (else (skip-list-tail (cdr lst) lst-so-far next)))
    )
  (skip-list-tail lst nil nil)
)



`(begin 
   (define-macro ,(cons 'anon bindings) ,body)
   anon))


(define-macro (eval-and-check expr1 expr2 expr3)
      `(if (begin ,expr1 ,expr2 ,expr3)
            'ok
            'fail))


