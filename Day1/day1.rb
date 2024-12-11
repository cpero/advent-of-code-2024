input = File.read('./Day1/input.txt')

list1 = []
list2 = []
input.split("\n").each do |line|
	p1, p2 = line.split(' ')
	list1 << p1.to_i
	list2 << p2.to_i
end

puts "Found #{list1.length} items for list 1"
puts "Found #{list2.length} items for list 2"

puts "POTENTIAL ERROR: List 1 and List 2 are not the same length" if list1.length != list2.length

list1.sort!
list2.sort!

diff_list = []
similarity_list = []

list1.each_with_index do |item, index|
	item2 = list2[index]
	diff_list << (item2 - item).abs

	similarity_list << item * list2.select{|i| i == item}.length
end

puts "The sum of the differences is #{diff_list.sum}"
puts "The sum of the similarities is #{similarity_list.sum}"
