div := Number getSlot("/") # had to google this bit

Number / := method(i,
    if (i == 0, 0, self div(i))
)

writeln("4 / 2 = ", 2/4)
writeln("2 / 4 = ", 2/4)
writeln("2 / 0 = ", 2/0)
