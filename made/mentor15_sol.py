

Shelly|40
Oreo|6
SELECT name, age FROM pets ORDER BY age DESC LIMIT 2


Dog|3.5
Cat|4
Tortoise|40
SELECT name, AVG(age) FROM pets GROUP BY type ORDER BY type




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


Matthew|Pie
Ivan|Ramen
select name, food
  from mentors
  where color = 'Green';
  
-- With aliasing
select m.name, m.food
  from mentors as m
  where m.color = 'Green';


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


Catherine|Jamie
Ethan|Kenny
select m1.name, m2.name
    from mentors as m1, mentors as m2
    where m1.language = m2.language and m1.name < m2.name;








    SELECT grades.day, SUM(score) 
    FROM grades, outfits 
    WHERE outfits.color = "blue" and outfits.day = grades.day 
    GROUP BY grades.day;


SELECT SUM(score), class
    FROM grades GROUP BY class
    HAVING MIN(score) < 80 ORDER BY SUM(score) DESC;


SELECT color, COUNT(g.day) AS cnt
    FROM outfits AS o, grades AS g
    WHERE o.day = g.day
    GROUP BY color
    ORDER BY cnt DESC
    LIMIT 1;


