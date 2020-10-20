# Class of Game
class Game
  attr_reader :board

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @avail_moves = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def available_moves
    @avail_moves.each do |num|
      print "  #{num}" if num >= 0 && num < 9
    end
  end

  def move(box_num, player)
    if @avail_moves.include?(box_num)
      ans = @avail_moves.index(box_num)
      @avail_moves[ans] = -1
      mark(box_num, player)
      true
    else
      false
    end
  end

  def game_status(player)
    return true if check_horizontal(player) || check_vertical(player) || check_cross(player)

    false
  end

  private

  def mark(box, player)
    @board[box] = player.sign
  end

  def check_horizontal(player)
    i = 0
    while i < 9
      return true if check_hor(i, player)

      i += 3
    end
    false
  end

  def check_hor(num, player)
    return true if @board[num] == player.sign && @board[num + 1] == player.sign && @board[num + 2] == player.sign

    false
  end

  def check_vertical(player)
    i = 0
    while i < 3
      return true if check_vert(i, player)

      i += 1
    end

    false
  end

  def check_vert(num, player)
    return true if @board[num] == player.sign && @board[num + 3] == player.sign && @board[num + 6] == player.sign

    false
  end

  def check_cross(player)
    return true if left_diag(player) || right_diag(player)

    false
  end

  def left_diag(player)
    return true if @board[0] == player.sign && @board[4] == player.sign && @board[8] == player.sign

    false
  end

  def right_diag(player)
    return true if @board[2] == player.sign && @board[4] == player.sign && @board[6] == player.sign

    false
  end
end

# players
class Player
  attr_accessor :name, :sign
  def initialize
    @name = ''
    @sign = ''
  end
end
