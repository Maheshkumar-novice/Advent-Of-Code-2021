#!/usr/bin/env ruby

# Bingo game
# 5 x 5 matrix
# Row Column match
# No Diagonal match allowed
# Given random numbers array
# Need to match with all the bingo matrices
# If I find any column or row bingo Then I need to sum the remainingnumbers except the bingo ones
# Then I need to multiply it with the last random array number try

# Steps:
# Create Random Array from the input file
# Create bingo matrices from the  input file
# Take one random array number at a time go through all the bingo arrays empty the slot of the random number
# Check for bingo with array and column after eliminating the number from the bingo array
# If bingo found then return the bingo array and the random number from  the array

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

numbers_array.each do |number|
  bingo_matrices.each do |bingo_matrix|
    eliminate_number_from_bingo_matrix(number, bingo_matrix)
    if bingo?(bingo_matrix)
      puts "Bingo!"
      pp bingo_matrix
      pp bingo_matrix.flatten!.reject! { |value| value == '' }
      puts "Number: #{number} Bingo Sum: #{bingo_matrix.sum}"
      puts "Answer: #{bingo_matrix.sum * number}"
      return
    end
  end
end
