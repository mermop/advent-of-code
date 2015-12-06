instructions = File.read('../data/06.txt').split("\n")

grid = [[]]
lights_lit = 0

for i in 0..1000 do
  for p in 0..1000 do
    grid.push([i, p, false])
  end
end

instructions.each do |i|
  puts i
  if i.start_with?('turn on')
    first_light = i.split('turn on ')[-1].split(' through ')[0].split(',')
    last_light = i.split('turn on ')[-1].split(' through ')[-1].split(',')
    action = 'on'
  end
  if i.start_with?('turn off')
    first_light = i.split('turn off ')[-1].split(' through ')[0].split(',')
    last_light = i.split('turn off ')[-1].split(' through ')[-1].split(',')
    action = 'off'
  end
  if i.start_with?('toggle')
    first_light = i.split('toggle ')[-1].split(' through ')[0].split(',')
    last_light = i.split('toggle ')[-1].split(' through ')[-1].split(',')
    action = 'toggle'
  end
  grid.each do |g|
    if g[0].to_i >= first_light[0].to_i && g[0].to_i <= last_light[0].to_i && g[1].to_i >= first_light[1].to_i && g[1].to_i <= last_light[1].to_i
      if action == 'on'
        g[2] = true
      end
      if action == 'off'
        g[2] = false
      end
      if action == 'toggle'
        g[2] = g[2].!
      end
    end
  end
end

grid.each do |g|
  if g[2] == true
    lights_lit += 1
  end
end

puts lights_lit
