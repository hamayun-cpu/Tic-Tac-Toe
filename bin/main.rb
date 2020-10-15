#!/usr/bin/env ruby
puts "\t\t\t\tHello to Tic Tac Toe game Build by Hamayun and Asad!"
puts "\n"
puts "Hey player-1, please enter your name:"
ply_1 = gets.chomp

puts "Hey player-2, please enter your name:"
ply_2 = gets.chomp
puts "\n"
puts "#{ply_1}, you have got X"
puts "#{ply_2}, you have got O"
puts "\n"
puts "****Gameboard is displayed****"

puts "NOTE: The player who wants to mark the box, just write its box number."

puts "#{ply_1}, you got the first turn"

i = 0
while i < 9
    if i.even?
        puts "#{ply_1} choose your box."
    else
        puts "#{ply_2} choose your box."
    end
    box = gets.chomp.to_i
    puts "****Gameboard is displayed****"
    i += 1
end
