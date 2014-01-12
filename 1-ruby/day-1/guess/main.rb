#!/usr/bin/env ruby

MAX_NUMBER = 1024  # TODO accept override as command-line arg
answer = rand(MAX_NUMBER) + 1
guess = nil
guesses = 0

puts 'Guess the number!'

while guess != answer
  print 'Guess? '
  guess = gets.to_i  # TODO catch bad input
  guesses += 1
  puts '=> too high' unless guess <= answer
  puts '=> too low' unless guess >= answer
end

puts '=> right!'
puts "It took you #{guesses} guesses!"

