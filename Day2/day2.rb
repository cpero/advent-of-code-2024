require 'active_support'
require "active_support/core_ext"

input = File.read('./Day2/input.txt')

reports = input.split("\n")

safe = []
unsafe = []

reports.each do |report|
	values = report.split(' ')

	dir = ''
	values.each_with_index do |value, index|
		if dir.blank?
			if value > values[index + 1]
				dir = 'desc'
			elsif value < values[index + 1]
				dir = 'asc'
			else
				dir = 'unsafe'
			end
		end

		if index + 1 < values.length && dir != 'unsafe'
			if dir == 'desc' && value < values[index + 1]
				dir = 'unsafe'
			elsif dir == 'asc' && value > values[index + 1]
				dir = 'unsafe'
			end

			diff = (value - values[index + 1]).abs
			if diff > 0 || diff < 4

			end
		end

		if dir == 'unsafe'
			unsafe << report
			break
		elsif index + 1 == values.length
			safe << report
		end
	end
end

puts "The total number of reports is #{reports.length}"
puts "The number of safe reports is #{safe.length}"
puts "The number of unsafe reports is #{unsafe.length}"

puts "INCORRECT MATH" if safe.length + unsafe.length != reports.length
