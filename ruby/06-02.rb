instructions = File.read('../data/06.txt').split("\n")

grid = [[]]
brightness = 0

for i in 0..1000 do
  for p in 0..1000 do
    grid.push([i, p, 0])
  end
end

instructions.each do |i|
  puts i
  if i.start_with?('turn on')
    first_light = i.split('turn on ')[-1].split(' through ')[0].split(',')
    last_light = i.split('turn on ')[-1].split(' through ')[-1].split(',')
    action = 'up'
  end
  if i.start_with?('turn off')
    first_light = i.split('turn off ')[-1].split(' through ')[0].split(',')
    last_light = i.split('turn off ')[-1].split(' through ')[-1].split(',')
    action = 'down'
  end
  if i.start_with?('toggle')
    first_light = i.split('toggle ')[-1].split(' through ')[0].split(',')
    last_light = i.split('toggle ')[-1].split(' through ')[-1].split(',')
    action = 'up2'
  end
  grid.each do |g|
    if g[0].to_i >= first_light[0].to_i && g[0].to_i <= last_light[0].to_i && g[1].to_i >= first_light[1].to_i && g[1].to_i <= last_light[1].to_i
      if action == 'up'
        g[2] += 1
        puts g[2]
      end
      if action == 'down' && g[2] > 0
        g[2] -= 1
        puts g[2]
      end
      if action == 'up2'
        g[2] += 2
        puts g[2]
      end
    end
  end
end

grid.each do |g|
  if g[2]
    brightness += g[2]
  end
end

puts brightness
