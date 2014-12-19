class MenuView
  def initialize(root)
    create_filled_menu_frame(root)
  end

  def set_start_button_action
    @startButton.command { yield }
  end

  def set_player_button_action
    @playerButton.command { yield }
  end

  def set_player_button_label(label)
    @playerButton.text = label
  end

  def show
    @menuFrame.pack
  end

  def hide
    @menuFrame.unpack
  end

private
  def create_filled_menu_frame(root)
    @menuFrame = TkFrame.new(root) { pack }

    @menuTitleLabel = TkLabel.new(@menuFrame) do
      text('Tic-tac-toe')
      font TkFont.new('times 20 bold')
      pack('padx' => '2', 'pady' => '20')
    end
    create_start_button
    create_player_button
    create_exit_button
  end

  def create_start_button
    @startButton = create_button('Start')
  end

  def create_player_button
    @playerButton = create_button('Player')
  end

  def create_exit_button
    @exitButon = create_button('Exit')
    @exitButon.command { exit }
  end

  def create_button(text)
    TkButton.new(@menuFrame) do
      text(text)
      width(15)
      pack('padx' => '2', 'pady' => '2')
    end
  end
end