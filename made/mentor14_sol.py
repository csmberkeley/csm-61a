

SELECT COUNT(species), SUM(pop) 
FROM fish;


SELECT species 
FROM fish 
ORDER BY pop DESC 
LIMIT 3;


SELECT species, price, MAX(pieces) 
FROM fish 
GROUP BY price;
    SELECT species, price, pieces 
    FROM fish 
    ORDER BY pieces / price DESC 
    LIMIT 2;






91 dog
229 pig
1618 tiger
SELECT SUM(weight), species FROM animals
    GROUP BY species HAVING COUNT(*) > 1 and SUM(weight) < 2000;


Buddy 	 Dug 
Buddy 	 Phil 
Buddy 	 Wilbur 
Dug 	 Phil 
Dug 	 Wilbur 
Phil 	 Wilbur
SELECT a.name, b.name 
    FROM animals AS a, animals AS b 
    WHERE a.name < b.name AND a.weight + b.weight <= 300 AND a.height <= 5 AND b.height <= 5;




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


Matthew|Pie
Ivan|Ramen
select name, food
  from mentors
  where color = 'Green';
  
-- With aliasing
select m.name, m.food
  from mentors as m
  where m.color = 'Green';


Catherine|Jamie
Ethan|Kenny
select m1.name, m2.name
    from mentors as m1, mentors as m2
    where m1.language = m2.language and m1.name < m2.name;






    SELECT grades.day, SUM(score) 
    FROM grades, outfits 
    WHERE outfits.color = 'blue' and outfits.day = grades.day 
    GROUP BY grades.day;


SELECT SUM(score), class
    FROM grades GROUP BY class
    HAVING MIN(score) < 80 ORDER BY SUM(score) DESC;


def total_weight(t):
  '''
  Return the total weight of a tree, i.e. the sum of all its labels.
  >>>total_weight(Tree(1, [Tree(2), Tree(3,[Tree(4)])]))
  10
  '''
  weight =  t.label + sum([total_weight(branch) for branch in t.branches])
  return weight
def equally_weighted(t):
  all_weights = [total_weight(b) for b in t.branches]
  for weight in all_weights[1:]:
    if weight != all_weights[0]:
      return False
  return True
def num_eq_weight(t):
  val = sum([num_eq_weight(b) for b in t.branches])
  if equally_weighted(t):
    return 1 + val
  else:
    return val


