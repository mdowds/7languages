a = [5,3,5,7,2,5,6,3,1,4,78,423,765,143,65,2]
indexes = [3,7,11,15]

indexes.each { |i| puts "#{a[i-3]} #{a[i-2]} #{a[i-1]} #{a[i]}" }
puts
a.each_slice(4) { |sl| puts sl }