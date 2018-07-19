next_fib := method(fibs, 
    max_index := (fibs size) - 1
    fibs at(max_index) + fibs at(max_index - 1)
)

fib := method(target,
    fibs := list(1,1)
    if((target == 1 or target == 2), 1, 
        for(i, 1, target, fibs append(next_fib(fibs)))
        fibs at(target - 1)
    )
)

get_fib := method(previous_fib, current_fib, target_index, current_index,
    if(current_index == target_index, current_fib, 
        next_fib := previous_fib + current_fib
        get_fib(current_fib, next_fib, target_index, current_index + 1)
    )
)

fib_recursive := method(target,
    get_fib(0, 1, target, 1)
)

writeln("1st fibonacci number: ", fib(1))
writeln("2nd fibonacci number: ", fib(2))
writeln("3rd fibonacci number: ", fib(3))
writeln("25th fibonacci number: ", fib(25))

writeln("1st fibonacci number: ", fib_recursive(1))
writeln("2nd fibonacci number: ", fib_recursive(2))
writeln("3rd fibonacci number: ", fib_recursive(3))
writeln("25th fibonacci number: ", fib_recursive(25))
