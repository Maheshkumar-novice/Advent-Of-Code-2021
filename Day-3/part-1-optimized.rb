#!/usr/bin/env ruby

data = File.readlines('input.txt').map do |binary_data|
  binary_data.chomp
end

rows = data.size
columns = data[0].size

zeroes_count = 0
ones_count = 0

value = ''
gamma = ''
epsilon = ''


columns.times do |column| 
  rows.times do |row|
    value = data[row][column]
    zeroes_count += 1 if value == '0'
    ones_count += 1 if value == '1'
  end
 
  if zeroes_count > ones_count
    gamma << '0'
    epsilon << '1'
  else
    gamma << '1'
    epsilon << '0'
  end
  
  zeroes_count = 0
  ones_count = 0
end

puts "Gamma Binary: #{gamma}"
puts "Epsilon Binary: #{epsilon}"
puts "Gamma Decimal: #{gamma.to_i(2)}"
puts "Epsilon Decimal: #{epsilon.to_i(2)}"
puts "Multiplication: #{gamma.to_i(2) * epsilon.to_i(2)}"
