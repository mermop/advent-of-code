f = File.read('01-santa.txt')
movements = f.split("")
position = 0
movement = 0
movements.each do |m|
  unless position == -1
    case m
      when "("
        position += 1
      when ")"
        position -= 1
    end
    puts position
    movement += 1
  end
end
puts movement
