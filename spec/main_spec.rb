require_relative '../lib/logic.rb'

describe Game do
  describe '#available_moves' do
    it 'print available moves' do
      game = Game.new
      expect(game.available_moves).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe '#move' do
    let(:player) { Player.new }

    let(:game) { Game.new }

    it 'verify the move and mark the board' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.move(2, player)).to eql(true)
    end

    it 'verify the move and mark the board' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.move(12, player)).to eql(false)
    end
  end

  describe '#game_status' do
    let(:player) { Player.new }

    let(:game) { Game.new }

    it 'return true if game is won by palyer and vice versa' do
      player.name = 'hamayun'
      player.sign = 'X'
      expect(game.game_status(player)).to eql(false)
    end

    it 'return true if game is won by palyer and vice versa' do
      player.name = 'hamayun'
      player.sign = 'X'
      game.board[0] = 'X'
      game.board[1] = 'X'
      game.board[2] = 'X'
      expect(game.game_status(player)).to eql(true)
    end
  end
end
