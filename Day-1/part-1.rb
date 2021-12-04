#!/usr/bin/env ruby

previous_depth = nil
increasing_count = File.readlines('input.txt').map(&:to_i).reduce(0) do |count, current_depth|
  count += 1 if (previous_depth && current_depth > previous_depth)
  previous_depth = current_depth
  count
end

puts "Total Increasing Count is #{increasing_count}"

