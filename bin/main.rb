#!/usr/bin/env ruby
# frozen_string_literal: false

puts "\t\t\t\tHello to Tic Tac Toe game Build by Hamayun and Asad!"
puts "\n"
puts 'Hey player-1, please enter your name'
ply_one = gets.chomp

puts 'Hey player-2, please enter your name'
ply_two = gets.chomp

def printt
  puts "\t\t\t******************************"
  puts "\t\t\t\t 0 | 1 | 2"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t 3 | 4 | 5"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t 6 | 7 | 8"
  puts "\t\t\t******************************"
end

puts "\n"
puts "#{ply_one}, you have got X"
puts "#{ply_two}, you have got O"
puts "\n"
puts '****Gameboard is displayed****'

puts 'NOTE: The player who wants to mark the box, just write its box number.'

puts "#{ply_one}, you got the first turn"

avail_moves = [0, 1, 2, 3, 4, 5, 6, 7, 8]

game_on = true
i = 0
while game_on
  puts 'available moves are : '
  avail_moves.each do |num|
    print "  #{num}" if num >= 0 && num < 9
  end
  puts "\n"
  if i.even?
    puts "#{ply_one} choose your box."
  else
    puts "#{ply_two} choose your box."
  end
  box = gets.chomp.to_i
  if avail_moves.include?(box)
    ans = avail_moves.index(box)
    avail_moves[ans] = -1
    i += 1
  else
    puts 'Invalid Move'
  end
  printt

  if i > 8
    puts "#{ply_two} WON"
    break
  end

  game_on = false if i == 7

end

puts 'Its a DRAW' unless game_on
