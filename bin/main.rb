# !/usr/bin/env ruby
require './lib/logic.rb'

def display(arr)
  puts "\t\t\t******************************"
  puts "\t\t\t\t #{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t #{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts "\t\t\t\t-----------"
  puts "\t\t\t\t #{arr[6]} | #{arr[7]} | #{arr[8]}"
  puts "\t\t\t******************************"
end

puts "\t\t\t\t*****Hello to Tic Tac Toe game Build by Hamayun and Asad!*****"

player_one = Player.new
player_two = Player.new

dif = false
while dif == false
  puts "\nHey player-1, please enter your name"
  name1 = gets.chomp

  puts 'Hey player-2, please enter your name'
  name2 = gets.chomp

  if name1 != name2 && !name1.empty? && !name2.empty?
    dif = true
    player_one.name = name1
    player_two.name = name2
  end
  puts "\n***Wrong input of names. Please Enter Again***" if dif == false

end

player_one.sign = 'X'
player_two.sign = 'O'
puts "\n#{player_one.name}, you have got X"
puts "#{player_two.name}, you have got O"

game_on = true

while game_on
  new_game = Game.new

  display(new_game.board)

  puts 'NOTE: The player who wants to mark the box, just write its box number.'

  puts "\n*****#{player_one.name}, you got the first turn*****"

  game_state = false
  turn = 0
  while turn < 9

    ans = false
    while ans == false
      puts "\nAvailable moves are : "
      new_game.available_moves
      puts "\n"

      if turn.even? # rubocop:disable Metrics/BlockNesting
        puts "#{player_one.name} choose your box."
      else
        puts "#{player_two.name} choose your box."
      end

      box = gets.chomp.to_i

      ans = new_game.move(box, player_one) if turn.even? # rubocop:disable Metrics/BlockNesting
      ans = new_game.move(box, player_two) unless turn.even? # rubocop:disable Metrics/BlockNesting

      puts "\n***Invalid Move***\n" unless ans # rubocop:disable Metrics/BlockNesting

    end

    display(new_game.board)

    game_state = new_game.game_status(player_one)
    if game_state
      puts "\n\t\t\t***Congratulations #{player_one.name}. You Won***"
      break
    end
    game_state = new_game.game_status(player_two)
    if game_state
      puts "\n\t\t\t***Congratulations #{player_two.name}. You Won***"
      break
    end

    turn += 1

  end

  puts 'The Game is Draw' unless game_state

  puts "\nDo You Want To Play Again? Press Y/y for Yes, N/n for No"

  us_ans = gets.chomp.upcase

  game_on = false if us_ans == 'N'

end
