#!/usr/bin/env ruby

data = File.readlines('input.txt')
horizontal = 0
depth = 0

data.each do |instruction|
  value = instruction.split(' ')[1].to_i
  if instruction =~ /forward/
    horizontal += value
  elsif instruction =~ /down/
    depth += value
  else
    depth -= value
  end
end

puts "Horizontal: #{horizontal} Depth: #{depth} Multiplied: #{horizontal * depth}"
