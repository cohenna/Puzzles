#!/usr/bin/env ruby

n = ARGV[0].to_i

# handle trivial base cases
if n == 0
	exit
elsif n == 1
	puts 'X'
	exit
end

X = 'X'
O = 'O'

# create a large reusable string of XOs since we print essentially the same garbage each iteration
garbage = 'XO' * (n/2-1) + X
if (n & 1) == 1
	garbage += O
	C = X
else
	C = O
end

(1..n).each do |x|
	# if x is even, start line with an O. Otherwise end with X or O dependent on whether n is odd
	if (x & 1) == 0
		print O
		puts garbage
	else
		print garbage
		puts C
	end
end
