require 'digest'
puzzle_input = "bgvyzdsv"
number = 0
md5 = Digest::MD5.new
result = md5.hexdigest(puzzle_input + number.to_s)

until md5.hexdigest(puzzle_input + number.to_s).start_with? "00000" do
  number+=1;
end

p number
