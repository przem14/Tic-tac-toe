require_relative '../Model/menu'
require_relative '../View/menu_view'
require_relative '../Controller/tic_tac_toe_controller'

class MenuController
  def initialize(mainWindow)
    @mainWindow = mainWindow
    @menu = Menu.new

    initialize_menu_view
  end

private
  def initialize_menu_view
    @menuView = MenuView.new(@mainWindow)

    @menuView.set_start_button_action { start_button_action }
    @menuView.set_player_button_action { player_button_action }
  end

  def start_button_action
    @menuView.hide
    TicTacToeController.new(@mainWindow, @menu.startPlayer)
  end

  def player_button_action
    @menu.startPlayer = (@menu.startPlayer == 'Player') ? 'CPU' : 'Player'
    @menuView.set_player_button_label(@menu.startPlayer)
  end
end