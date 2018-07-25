List myAverage := method(
    nonNumbers := select (x, x type != "Number") # type method returns a string
    if(nonNumbers size == 0, 
        sum / size,
        Exception raise("Not all elements are numbers")
    )
)

writeln("Expecting 1.5, actual ", list(1,2) myAverage)
writeln("Expecting exception: ", list(1,"two") myAverage)
