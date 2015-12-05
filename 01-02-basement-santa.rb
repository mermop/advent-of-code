f = File.read('01-santa.txt')
position = 0
movement = 0
f.each_char do |m|
  unless position == -1
    case m
      when "("
        position += 1
      when ")"
        position -= 1
    end
    movement += 1
  end
end
puts movement
