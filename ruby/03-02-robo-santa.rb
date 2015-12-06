class Santa
  def initialize
    @x = 0
    @y = 0
  end
  def move(d)
    case d
    when "^"
      @y += 1
    when "v"
      @y -= 1
    when ">"
      @x += 1
    when "<"
      @x -= 1
    end
  end
  def add_position(to)
    to.push([@x, @y])
  end
end

directions = File.read('../data/03-directions.txt')
directions = directions.split("")
human_santa = Santa.new
robo_santa = Santa.new
delivered_positions = Array.new
santa = true

human_santa.add_position(delivered_positions)
robo_santa.add_position(delivered_positions)

directions.each do |d|
  if santa == true
    human_santa.move(d)
    human_santa.add_position(delivered_positions)
    santa = false
  else
    robo_santa.move(d)
    robo_santa.add_position(delivered_positions)
    santa = true
  end
end

delivered_positions.uniq!
puts delivered_positions.length
