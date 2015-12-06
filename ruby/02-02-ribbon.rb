class Package
  def initialize(d)
    @l = d[0].to_i
    @w = d[1].to_i
    @h = d[2].to_i
  end
  def to_s
    puts "length: #{@l}, width: #{@w}, height: #{@h}"
  end
  def ordered_dimensions
    [@l, @h, @w].sort
  end
  def surface_area
    2*@l*@w + 2*@w*@h + 2*@h*@l
  end
  def slack
    ordered_dimensions[0] * ordered_dimensions[1]
  end
  def ribbon
    ordered_dimensions[0]*2 + ordered_dimensions[1]*2
  end
  def bow
    @l * @h * @w
  end
end

packages = File.read('../data/02-wrapping-paper.txt')
packages = packages.split("\n")
package_array = []
packages.each do |p|
  package_array.push( Package.new(p.split('x')) )
end
total_wrapping_paper = 0
package_array.each do |p|
  total_wrapping_paper += p.surface_area + p.slack
end
total_ribbon = 0
package_array.each do |p|
  total_ribbon += p.ribbon + p.bow
end
puts total_ribbon
