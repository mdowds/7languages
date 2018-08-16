book(leviathan_wakes, corey).
book(nemesis_games, corey).
book(nineteen_eighty_four, orwell).
book(animal_farm, orwell).

nationality(corey, us).
nationality(orwell, uk).

book_from(X, Y) :- nationality(Z, X), book(Y, Z).
