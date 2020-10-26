require_relative '../lib/logic.rb'

describe Player do
  describe '#initialize' do
    let(:player) { Player.new }

    it 'Checks that is name initialized as empty string' do
      # player = Player.new
      expect(player.name).to eql('')
    end

    it 'Checks that is sign initialized as empty string' do
      # player = Player.new
      expect(player.sign).to eql('')
    end
  end
end

describe Game do
  describe '#initialize' do
    it 'print available moves' do
      game = Game.new
      expect(game.board).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe '#available_moves' do
    it 'print available moves' do
      game = Game.new
      expect(game.available_moves).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe '#move' do
    let(:player) { Player.new }

    let(:game) { Game.new }

    it 'return true if the movement of player is valid' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.move(2, player)).to eql(true)
    end

    it 'return false if the movement of player is not valid' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.move(12, player)).to eql(false)
    end
  end

  describe '#game_status' do
    let(:player) { Player.new }

    let(:game) { Game.new }
    it 'return false if game is not won by player' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.game_status(player)).to eql(false)
    end

    it 'return true if game is won by player' do
      player.name = 'hamayun'
      player.sign = 'X'
      game.board[0] = 'X'
      game.board[1] = 'X'
      game.board[2] = 'X'
      expect(game.game_status(player)).to eql(true)
    end
  end
end
