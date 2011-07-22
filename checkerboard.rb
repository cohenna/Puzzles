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

# let's go!
(1..n).each do |x|
	# if x is even, start line with an O
	if (x & 1) == 0
		print O
	end
	
	# print garbage
	print garbage	
	
	# we have some cleanup to do since garbage is not yet long enough (TWSS)
	if (x & 1) == 1
		# x is odd
		print O
	end
	
	if (n & 1) == 1
		# n is odd
		if (x & 1) == 1
			# x is odd
			print X
		else
			# x is even
			print O
		end
	end
	
	# print a new line (could check for last iteration and not print new line but punting)
	puts
end
