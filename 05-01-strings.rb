# It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
# It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

class Santastring
  def initialize(s)
    @s = s
    @niceness = false
  end
  def naughty_or_nice do
    case @s
    when /.*ab|cd|pq|xy.*/
      @niceness = false
    when /.*[aeiou].*[aeiou].*[aeiou].*/
      if @s =~ /(\w)\1+/
        @niceness = true
      end
    end
  end
end

strings = File.read('05-strings.txt').split("\n")
strings.each do |s|
  Santastring.new(s)
end
naughty_strings = 0
nice_strings = 0

strings.each do |s|
  if s.include?('ab')
    naughty_strings += 1
  end
  if s.include?('cd')
    naughty_strings += 1
  end
  if s.include?('pq')
    naughty_strings += 1
  end
  if s.include?('xy')
    naughty_strings += 1
  end
  if s =~ /[aeiou].*[aeiou].*[aeiou]/
    nice_strings += 1
  end
  if s =~ /.{2}/
    nice_strings += 1
  end
end

puts "Naughty: #{naughty_strings}"
puts "Nice: #{nice_strings}"
