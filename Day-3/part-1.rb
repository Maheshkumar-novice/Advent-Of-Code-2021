#!/usr/bin/env ruby

data = File.readlines('input.txt').map do |binary_data|
  binary_data.chomp
end

frequency = Hash.new { |hash, key| hash[key] = {'0' => 0, '1' => 0} }

data.each do |binary_data|
  index = 1 
  binary_data.split('').each do |bit|
    frequency[index][bit] += 1
    index += 1
  end
end 

puts "Frequency Hash: "
pp frequency

gamma = ''
epsilon = ''

frequency.each do |key, value|
  zeroes_count = frequency[key]['0']
  ones_count = frequency[key]['1']

  if zeroes_count > ones_count
    gamma << '0'
    epsilon << '1'
  else
    gamma << '1'
    epsilon << '0'
  end
end

puts "Gamma Binary: #{gamma}"
puts "Epsilon Binary: #{epsilon}"
puts "Gamma Decimal: #{gamma.to_i(2)}"
puts "Epsilon Decimal: #{epsilon.to_i(2)}"
puts "Multiplication: #{gamma.to_i(2) * epsilon.to_i(2)}"
