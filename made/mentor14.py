











91 dog
229 pig
1618 tiger


Buddy 	 Dug 
Buddy 	 Phil 
Buddy 	 Wilbur 
Dug 	 Phil 
Dug 	 Wilbur 
Phil 	 Wilbur




Adit|Protein Bar|Black|Vim|Python|Gorilla
Aiko|Fries|Sky Blue|VSCode|Java|Cat
Alyssa|Pork Bulgogi|Navy Blue|Vim|Java|Sea Otter
Aurelia|Dumpling|Pastel Yellow|VSCode|Python|Panda
Esther|Goldfish|Pastel Pink|VSCode|Python|Bunny
Kaelyn|Popcorn|Blue|VSCode|Java|Panda
Vibha|Pasta|Teal|VSCode|Java|Naked Mole Rat


Pork Bulgogi|Navy Blue
Pasta|Teal
Fries|Sky Blue
Popcorn|Blue


Matthew|Pie
Ivan|Ramen


Catherine|Jamie
Ethan|Kenny










def total_weight(t):
  '''
  Return the total weight of a tree, i.e. the sum of all its labels.
  >>>total_weight(Tree(1, [Tree(2), Tree(3,[Tree(4)])]))
  10
  '''
  weight =  t.label + sum([total_weight(branch) for branch in t.branches])
  return weight
def equally_weighted(t):
  '''
  Return whether a tree is equally weighted.
  >>>equally_weighted(Tree(1))
  True
  >>>equally_weighted(Tree(1,[Tree(2), Tree(1, [Tree(1)])]))
  True
  >>>equally_weighted(Tree(0, [Tree(3), Tree(2, [Tree(3)])]))
  False
  '''
  _______________________ = [_________________________]

  for _______________ in _____________________________:

    if _____________________________:

      return ______________________________________

  return __________________________________________
def num_eq_weight(t):
  '''
  Return the number of equally weighted subtrees of t. Note that t is considered a subtree of itself.
  >>> num_eq_weight(Tree(1, [Tree(4), Tree(3,[Tree(1)])]))
  4
  >>> num_eq_weight(Tree(1, [Tree(9), 
                             Tree(1, [Tree(4), 
                                      Tree(3,[Tree(1)])])]))
  6
  >>> num_eq_weight(Tree(1, [Tree(8, [Tree(1)]), 
                             Tree(1, [Tree(4), 
                                      Tree(3,[Tree(1)])])]))
  7
  '''
  val = ______________________________________________

  if ______________________________________:

    return ___________________________________________
  else:
    return val


