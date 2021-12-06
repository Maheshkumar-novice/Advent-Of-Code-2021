#!/usr/bin/env ruby

depths = File.readlines('input.txt').map(&:to_i)

previous_depth = nil
increasing_count = 0
starting_index = 0

until starting_index == depths.size - 2
  ending_index = starting_index + 2

  window_1 = depths[starting_index..ending_index]
  window_2 = depths[(starting_index + 1)..(ending_index + 1)]

  window_1_sum = window_1.sum
  window_2_sum = window_2.sum

  increasing_count += 1 if window_2_sum > window_1_sum

  starting_index += 1
end

puts "Total Increasing Count is #{increasing_count}" 
