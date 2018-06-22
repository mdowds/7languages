n = rand(10)
guess = nil

until guess == n
    puts "Guess a number: "
    guess = gets().to_i
    if guess < n
        puts "Too low, try again"
    elsif guess > n
        puts "Too high, try again"
    end
end

puts "You win!"