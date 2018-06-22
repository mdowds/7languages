def grep(file, str)
    if File.exists?(file)
        File.foreach(file) {|line|
            puts line unless line.index(str) == nil
        }
    else
        puts "File #{file} does not exist"
    end
    puts
end

grep('example.txt', 'ruby')
grep('notafile', 'ruby')