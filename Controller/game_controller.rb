require_relative '../Model/game'
require_relative '../View/game_view'
require_relative '../Controller/menu_controller'

class GameController
  def initialize
    @game = Game.new
    @gameView = GameView.new

    run
  end

private
  def run
    MenuController.new(@gameView.root)

    Tk.mainloop
  end
end