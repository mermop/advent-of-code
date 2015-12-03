f = File.read('01-santa.txt')
answer = f.count('(') - f.count(')')
puts answer
