numbers = (1..16).to_a

i = 0
while i < 16 do
  puts "#{numbers[i..i+3]}"
  i = i + 4
end

numbers.each_slice(4) {|a| puts "#{a}"}
