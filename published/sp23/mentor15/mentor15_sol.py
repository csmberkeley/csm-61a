

CREATE TABLE mentors AS
  SELECT 'Alyssa' as name, 'Pork Bulgogi' as food, 'Navy Blue' as color, 'Vim' as editor, 'Java' as language, 'Sea Otter' as animal UNION
  SELECT 'Vibha', 'Pasta', 'Teal', 'VSCode', 'Java', 'Naked Mole Rat' UNION
  SELECT 'Adit', 'Protein Bar', 'Black', 'Vim', 'Python', 'Gorilla' UNION
  SELECT 'Esther', 'Goldfish', 'Pastel Pink', 'VSCode', 'Python', 'Bunny' UNION
  SELECT 'Aiko', 'Fries', 'Sky Blue', 'VSCode', 'Java', 'Cat' UNION
  SELECT 'Aurelia', 'Dumpling', 'Pastel Yellow', 'VSCode', 'Python', 'Panda' UNION
  SELECT 'Kaelyn', 'Popcorn', 'Blue', 'VSCode', 'Java', 'Panda';


Adit|Protein Bar|Black|Vim|Python|Gorilla
Aiko|Fries|Sky Blue|VSCode|Java|Cat
Alyssa|Pork Bulgogi|Navy Blue|Vim|Java|Sea Otter
Aurelia|Dumpling|Pastel Yellow|VSCode|Python|Panda
Esther|Goldfish|Pastel Pink|VSCode|Python|Bunny
Kaelyn|Popcorn|Blue|VSCode|Java|Panda
Vibha|Pasta|Teal|VSCode|Java|Naked Mole Rat
SELECT * 
FROM mentors 
ORDER BY name;


Pork Bulgogi|Navy Blue
Pasta|Teal
Fries|Sky Blue
Popcorn|Blue
SELECT food, color
  FROM mentors
  WHERE language != 'Python';

-- With aliasing (treating the table as a Python object) --
SELECT m.food, m.color
  FROM mentors as m
  WHERE m.language <> 'Python';




SELECT species 
FROM fish 
ORDER BY pop DESC 
LIMIT 3;


SELECT COUNT(species), SUM(pop) 
FROM fish;


SELECT species, price, MAX(pieces) 
FROM fish 
GROUP BY price;


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


