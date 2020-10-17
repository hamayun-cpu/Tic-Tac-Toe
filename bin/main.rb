#!/use/bin/env ruby

puts "\t\t\t\tHello to Tic Tac Toe game Build by Hamayun and Asad!"
puts "\n"
dif = false

while dif == false
  puts 'Hey player-1, please enter your name'
  ply_one = gets.chomp

  puts 'Hey player-2, please enter your name'
  ply_two = gets.chomp

  dif = true if !ply_one.empty? && !ply_two.empty? && ply_one != ply_two
  puts 'Wrong Input' if dif == false
end

def printt(arr)
  puts "\t\t\t******************************"
  puts "\t\t\t\t #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t #{arr[6]} | #{arr[7]} | #{arr[8]}"
  puts "\t\t\t******************************"
end

puts "\n"
puts "#{ply_one}, you have got X"
puts "#{ply_two}, you have got O"
puts "\n"
board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
puts 'NOTE: The player who wants to mark the box, just write its box number.'
printt(board)

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

    board[ans] = 'X' if i.even?
    board[ans] = 'O' unless i.even?

    i += 1
  else
    puts 'Invalid Move'
  end
  printt(board)

  if i > 8
    puts "#{ply_two} WON"
    break
  end

  game_on = false if i == 7

end

puts 'Its a DRAW' unless game_on
