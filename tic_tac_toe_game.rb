require_relative 'Controller/game_controller'

class TicTacToeGame
  def initialize
    GameController.new
  end
end

TicTacToeGame.new