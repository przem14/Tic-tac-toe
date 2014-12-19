class TicTacToeView
  def initialize(mainWindow)
    @mainWindow = mainWindow
    @boardFieldsFrames = [[],[],[]]

    create_board
    create_winner_screen
  end

  def create_cross(x, y)
    cross = TkCanvas.new(@boardFieldsFrames[x][y]) { place('height' => 80, 'width' => 80) }

    TkcLine.new(cross, 0, 0, 80, 80);
    TkcLine.new(cross, 0, 80, 80, 0);
  end

  def create_circle(x, y)
    circle = TkCanvas.new(@boardFieldsFrames[x][y]) { place('height' => 80, 'width' => 80) }

    TkcOval.new(circle, 5, 5, 75, 75)
  end

  def set_field_action(x, y)
    @boardFieldsFrames[x][y].bind('ButtonRelease-1') { yield }
  end

  def set_back_to_menu_button_action
    @backToMenuButton.command { yield }
  end

  def hide
    hide_board
    hide_winner_screen
  end

  def show_winner_screen(winner)
    hide_board
    @winnerLabel.text(winner)
    @winnerScreenFrame.pack
  end

private
  def hide_board
    @boardFrame.unpack
  end

  def hide_winner_screen
    @winnerScreenFrame.unpack
  end

  def create_board
    @boardFrame = TkFrame.new(@mainWindow) { pack }
    create_board_frames
  end

  def create_board_frames
    for x in 0..2 do
      for y in 0..2 do
        @boardFieldsFrames[x].push(create_field_frame(x, y))
      end
    end
  end

  def create_field_frame(x, y)
    TkFrame.new(@boardFrame) do
      relief('sunken')
      borderwidth(1)
      width(80)
      height(80)
      grid('row' => y, 'column' => x)
    end
  end

  def create_winner_screen
    @winnerScreenFrame = TkFrame.new(@mainWindow)

    create_winner_screen_title_label
    create_winner_label
    create_back_to_menu_button
  end

  def create_back_to_menu_button
    @backToMenuButton = TkButton.new(@winnerScreenFrame) do
      text('Back')
      width(15)
      pack('padx' => '2', 'pady' => '10')
    end
  end

  def create_winner_label
    @winnerLabel = TkLabel.new(@winnerScreenFrame) do
      font TkFont.new('times 40 bold')
      pack('padx' => '2', 'pady' => '20')
    end
  end

  def create_winner_screen_title_label
    TkLabel.new(@winnerScreenFrame) do
      text('The winner is...')
      font TkFont.new('times 20 bold')
      pack('padx' => '2', 'pady' => '20')
    end
  end
end