f = File.read('../data/01-santa.txt')
answer = f.count('(') - f.count(')')
puts answer
