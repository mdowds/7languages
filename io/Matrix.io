Matrix := List clone
Matrix dim := method(x,y,
    for(i, 1, x, 
        row := List clone
        row setSize(y)
        append(row)
    )
)

Matrix set := method(x, y, value,
    row := at(x)
    row insertAt(value, y)
)

Matrix get := method(x, y, at(x) at (y))

matrix := Matrix clone
matrix dim(2,3)

writeln("Expected x size 2, actual ", matrix size)
writeln("Expected y size 3, actual ", matrix at(0) size)

matrix set(0,1, "Hello")

writeln("Expected value at (0,1) to be Hello, actual ", matrix get(0,1))
