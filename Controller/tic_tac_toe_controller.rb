require_relative '../Model/tic_tac_toe'
require_relative '../View/tic_tac_toe_view'
require_relative '../Controller/menu_controller'

class TicTacToeController
  def initialize(mainWindow, startPlayer)
    @mainWindow = mainWindow
    @ticTacToe = TicTacToe.new(startPlayer)
    @ticTacToeView = TicTacToeView.new(@mainWindow)

    bind_field_actions
    @ticTacToeView.set_back_to_menu_button_action { back_to_menu_action }

    field = @ticTacToe.cpuLastMove
    draw_cpu_field(field[0], field[1]) unless field.nil?
  end

private
  def field_action(x, y)
    @ticTacToeView.set_field_action(x, y) { clicked_field(x, y) }
  end

  def clicked_field(x, y)
    return unless @ticTacToe.nextMove(x, y)
    draw_player_field(x, y)

    field = @ticTacToe.cpuLastMove
    draw_cpu_field(field[0], field[1]) unless field.nil?

    if @ticTacToe.end?
      @ticTacToeView.show_winner_screen(@ticTacToe.winner)
    end
  end

  def bind_field_actions
    for x in 0..2 do
      for y in 0..2 do
        field_action(x, y)
      end
    end
  end

  def back_to_menu_action
    @ticTacToeView.hide
    MenuController.new(@mainWindow)
  end

end

  def draw_player_field(x, y)
    @ticTacToeView.create_circle(x, y) if @ticTacToe.playerFigure == 'Circle'
    @ticTacToeView.create_cross(x, y) if @ticTacToe.playerFigure == 'Cross'
  end

  def draw_cpu_field(x, y)
    @ticTacToeView.create_circle(x, y) if @ticTacToe.cpuFigure == 'Circle'
    @ticTacToeView.create_cross(x, y) if @ticTacToe.cpuFigure == 'Cross'
  end