#!/usr/bin/env ruby

def get_number_array_from_input_file(input)
  input.shift.split(',').map(&:to_i)
end 

def make_bingo_matrix(input)
  input.split("\n").map do |data|
    data.split(" ").map(&:to_i)
  end
end

def get_bingo_matrices_from_input_file(input)
  bingo_matrices = []
  input.each do |bingo_data|
    bingo_matrices << make_bingo_matrix(bingo_data)
  end
  bingo_matrices
end

def eliminate_number_from_bingo_matrix(number, bingo_matrix)
  bingo_matrix.each do |row|
    row.map! { |value| value == number ? '' : value }
  end
end

def row_bingo?(bingo_matrix)
  bingo_matrix.each do |row|
    result = row.all? { |value| value == '' }
    return true if result
  end
  false
end

def column_bingo?(bingo_matrix)
  bingo_matrix.transpose.each do |column|
    result = column.all? { |value| value == '' }
    return true if result
  end
  false
end

def bingo?(bingo_matrix)
  return true if row_bingo?(bingo_matrix) || column_bingo?(bingo_matrix)
  
  false
end

input = File.read('input.txt').split("\n\n")
numbers_array = get_number_array_from_input_file(input)
bingo_matrices = get_bingo_matrices_from_input_file(input)
already_bingo = []
last_bingo_data = []

numbers_array.each do |number|
  bingo_matrices.each do |bingo_matrix|
    next if already_bingo.include?(bingo_matrix)
    eliminate_number_from_bingo_matrix(number, bingo_matrix)
    if bingo?(bingo_matrix)
      last_bingo_data = []
      last_bingo_data << number
      last_bingo_data << bingo_matrix
      already_bingo << bingo_matrix
    end
  end
end

number = last_bingo_data[0]
bingo_matrix = last_bingo_data[1]
puts "Bingo!"
pp bingo_matrix
pp bingo_matrix.flatten!.reject! { |value| value == '' }
puts "Number: #{number} Bingo Sum: #{bingo_matrix.sum}"
puts "Answer: #{bingo_matrix.sum * number}"
