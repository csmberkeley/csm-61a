(define-macro (and-odds exprs)
    `(if (> (length ,exprs) 2)
          (and (car ,exprs) (and-odds (cdr (cdr ,exprs))))
          (eval (car ,exprs))
    )
)




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


