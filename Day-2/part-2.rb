#!/usr/bin/env ruby

data = File.readlines('input.txt')
horizontal = 0
depth = 0
aim = 0

data.each do |instruction|
  value = instruction.split(' ')[1].to_i
  if instruction =~ /forward/
    horizontal += value
    depth += (aim * value)
  elsif instruction =~ /down/
    aim += value
  else
    aim -= value
  end
end

puts "Horizontal: #{horizontal} Depth: #{depth} Multiplied: #{horizontal * depth}"
