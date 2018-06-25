def do_thing (x)
    yield if x == true
end

do_thing (true) { puts 'hi' }
do_thing (false) { puts 'hi' }