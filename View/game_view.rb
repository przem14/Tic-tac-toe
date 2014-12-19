require 'tk'

class GameView
  MAIN_WINDOW_WIDTH  = 240;
  MAIN_WINDOW_HEIGHT = 240;

  attr_reader :root

  def initialize
    @root = TkRoot.new do
      title('Tic-tac-toe')
      minsize(MAIN_WINDOW_WIDTH, MAIN_WINDOW_HEIGHT)
    end
  end
end