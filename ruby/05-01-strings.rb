strings = File.read('../data/05-strings.txt').split("\n")
nice_strings = 0
strings.each do |s|
  if s =~ /(\w)\1+/ && s =~ /.*[aeiou].*[aeiou].*[aeiou].*/ && s !~ /.*ab|cd|pq|xy.*/
    nice_strings += 1
  end
end

puts "Nice: #{nice_strings}"
