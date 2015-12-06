directions = File.read('../data/03-directions.txt')
directions = directions.split("")
current_x = 0
current_y = 0
delivered_positions = Array.new
delivered_positions.push([0, 0])
directions.each do |d|
  case d
  when "^"
    current_y += 1
  when "v"
    current_y -= 1
  when ">"
    current_x += 1
  when "<"
    current_x -= 1
  end
  delivered_positions.push([current_x, current_y])
end
delivered_positions.uniq!
puts delivered_positions.length
