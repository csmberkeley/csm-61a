

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






SELECT species 
FROM fish 
ORDER BY pop DESC 
LIMIT 3;


SELECT COUNT(species), SUM(pop) 
FROM fish;


SELECT species, price, MAX(pieces) 
FROM fish 
GROUP BY price;
    SELECT species, price, pieces 
    FROM fish 
    ORDER BY pieces / price DESC 
    LIMIT 2;


        SELECT fish.species, fish.price, competitor.price
        FROM fish, competitor
        WHERE fish.species = competitor.species;


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


    SELECT grades.day, sum(score) 
    FROM grades, outfits 
    WHERE outfits.color = "blue" and outfits.day = grades.day 
    GROUP BY grades.day;


