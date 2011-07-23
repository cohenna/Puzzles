#!/usr/bin/env ruby

require 'stringio'

n = ARGV[0].to_i
X = 'X'
O = 'O'

# suppresses STDOUT
def profile
	start = Time.now
	previous_stdout, $stdout = $stdout, StringIO.new
	yield
	Time.now - start
ensure
	$stdout = previous_stdout
end

def quadratic(n)
	flip = true
	(1..n).each do |i|
		(1..n).each do |j|
			if flip	
				print X
			else
				print O
			end
			flip = !flip
		end
		if n & 1 == 0
			flip = !flip
		end
		puts
	end
end

def linear(n)
	# handle trivial base cases
	if n == 0
		exit
	elsif n == 1
		puts 'X'
		exit
	end

	# create a large reusable string of XOs since we print essentially the same garbage each iteration
	garbage = 'XO' * (n/2-1) + X
	if (n & 1) == 1
		garbage += O
		c = X
	else
		c = O
	end

	(1..n).each do |x|
		# if x is even, start line with an O. Otherwise end with X or O dependent on whether n is odd
		if (x & 1) == 0
			print O
			puts garbage
		else
			print garbage
			puts c
		end
	end
end

linear_time = profile { linear(n) }
puts "linear(#{n}) = #{linear_time} seconds"

quadratic_time = profile { quadratic(n) }
puts "quadratic(#{n}) = #{quadratic_time} seconds"
