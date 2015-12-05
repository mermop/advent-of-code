strings = File.read('05-strings.txt').split("\n")
nice_strings = 0
strings.each do |s|
  if s =~ /(\w{2}).*\1+/ && s =~ /(\w).\1/
    nice_strings += 1
  end
end

puts "Nice: #{nice_strings}"
