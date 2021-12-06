#!/usr/bin/env ruby

depths = File.readlines('input.txt').map(&:to_i)

window_1_sum = depths[0..2].sum
window_1_starting_index = 0
window_2_ending_index = 3
increasing_count = 0

until window_1_starting_index == depths.size - 3
  window_2_sum = window_1_sum + depths[window_2_ending_index] - depths[window_1_starting_index]
  increasing_count += 1 if window_2_sum > window_1_sum
  window_1_sum = window_2_sum
  window_1_starting_index += 1
  window_2_ending_index += 1
end

puts "Total Increasing Count is #{increasing_count}"
