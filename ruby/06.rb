# Because your neighbors keep defeating you in the holiday house decorating contest year after year, you've decided to deploy one million lights in a 1000x1000 grid.
#
# Furthermore, because you've been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.
#
# Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off.
#
# To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.
#
# For example:
#
# turn on 0,0 through 999,999 would turn on (or leave on) every light.
# toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
# turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.
# After following the instructions, how many lights are lit?
#

instructions = File.read('../data/06.txt').split("\n")

grid = [[]]
lights_lit = 0

for i in 0..1000 do
  for p in 0..1000 do
    grid.push([i, p, false])
  end
end

instructions.each do |i|
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
# turn on
# turn off
# toggle
