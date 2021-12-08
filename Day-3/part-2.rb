#!/usr/bin/env ruby

data = File.readlines('input.txt').map do |binary_data|
  binary_data.chomp
end

start_column_index = 0
zeroes_candidates = []
ones_candidates = []
o2_rating_candidates = []
co2_rating_candidates = []
loop do    
 if start_column_index.zero?
    data.each do |binary_data|
      zeroes_candidates << binary_data  if binary_data[0] == '0'
      ones_candidates << binary_data if binary_data[0] == '1'
    end
    if zeroes_candidates.size > ones_candidates.size
      o2_rating_candidates = zeroes_candidates
      co2_rating_candidates = ones_candidates
    else zeroes_candidates.size <= ones_candidates.size
      o2_rating_candidates = ones_candidates
      co2_rating_candidates = zeroes_candidates
    end
    start_column_index += 1
    zeroes_candidates = []
    ones_candidates = []
  else
    break if o2_rating_candidates.size == 1 && co2_rating_candidates.size == 1
    
    o2_rating_candidates.each do |data|
      next if o2_rating_candidates.size == 1
      zeroes_candidates << data if data[start_column_index] == '0'
      ones_candidates << data if data[start_column_index] == '1'
    end
    
    o2_rating_candidates = zeroes_candidates if zeroes_candidates.size > ones_candidates.size && o2_rating_candidates.size != 1
    o2_rating_candidates = ones_candidates if zeroes_candidates.size <= ones_candidates.size && o2_rating_candidates.size != 1

    zeroes_candidates = []
    ones_candidates = []

    co2_rating_candidates.each do |data|
      next if co2_rating_candidates.size == 1
      zeroes_candidates << data if data[start_column_index] == '0'
      ones_candidates << data if data[start_column_index] == '1'
    end

    co2_rating_candidates = zeroes_candidates if zeroes_candidates.size <= ones_candidates.size && co2_rating_candidates.size != 1
    co2_rating_candidates = ones_candidates if zeroes_candidates.size > ones_candidates.size && co2_rating_candidates.size != 1

    zeroes_candidates = []
    ones_candidates = []
    start_column_index += 1
  end
end

puts o2_rating_candidates[0].to_i(2)
puts co2_rating_candidates[0].to_i(2)
puts o2_rating_candidates[0].to_i(2) * co2_rating_candidates[0].to_i(2)
