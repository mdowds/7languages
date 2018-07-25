twoDimensionalArray := list(
    list(1,2,3),
    list(4,5,6),
    list(7,8,9)
)

twoDimensionalSum := method(twoDArray,
    # reduce(running total, ref to current list member, function, initial value)
    twoDArray reduce(runningTotal, oneDArray, runningTotal + (oneDArray sum), 0)
)

# Simpler implementation after stumbling upon flatten in the docs
List flatSum := method(flatten sum)

writeln("Expecting 45, actual ", twoDimensionalSum(twoDimensionalArray))
writeln("Expecting 45, actual ", twoDimensionalArray flatSum)
