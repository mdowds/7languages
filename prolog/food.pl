food_type(cheddar, cheese).
food_type(ryvita, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(coke, cola).
food_type(rich_tea, biscuit).

flavour(sweet, biscuit).
flavour(savoury, meat).
flavour(savoury, cheese).
flavour(sweet, cola).

food_flavour(X, Y) :- food_type(X, Z), flavour(Y, Z).
