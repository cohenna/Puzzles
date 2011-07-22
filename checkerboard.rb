#!/usr/bin/env ruby

n = ARGV[0].to_i

# handle trivial base cases
if n == 0
	exit
elsif n == 1
	puts 'X'
	exit
end

# create a large reusable string of XOs since we print essentially the same garbage each iteration
bigstring = 'XO' * (n/2-1)

# let's go!
(1..n).each do |x|
	# if x is even, start line with an O
	if (x & 1) == 0
		print 'O'
	end
	
	# print garbage
	print bigstring	
	
	# if x is odd, add an X
	if (x & 1) == 1
		print 'X'
	end

	# we have some cleanup to do since bigstring is not yet long enough (TWSS)
	if (n & 1) == 1
		if (x & 1) == 1
			# n is odd, X is odd
			print 'OX'
		else
			# n is odd, X is even
			print 'XO'
		end
	else
		if (x & 1) == 1
			# n is even, X is odd
			print 'O'
		else
			# n is even, X is even
			print 'X'
		end
	end
	
	# print a new line (could check for last iteration and not print new line but punting)
	puts
end
