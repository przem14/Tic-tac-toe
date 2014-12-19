class TicTacToe
  attr_reader :startPlayer
  attr_reader :cpuFigure
  attr_reader :playerFigure
  attr_reader :moveCounter
  attr_reader :winner
  attr_reader :cpuLastMove

  def initialize(startPlayer)
    @startPlayer = startPlayer
    @playerFigure = (startPlayer == 'Player') ? 'Cross': 'Circle'
    @cpuFigure = (startPlayer == 'Player') ? 'Circle' : 'Cross'
    @moveCounter = 0
    @winner = 'None'
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @cpuLastMove = nil

    start
  end

  def set_next_player
    (@startPlayer == 'Player') ? @startPlayer = 'CPU' : @startPlayer = 'Player'
    @moveCounter += 1
  end

  def nextMove(x, y)
    return false unless @board[x][y].nil?
    return false if end?

    player_move(x, y)
    cpu_move
    true
  end

  def end?
    @moveCounter == 9 || @winner != 'None'
  end

private
  def start
    @moveCounter = 0
    @winner = 'None'

    if @startPlayer == 'CPU' then
      cpu_rand_field
      set_next_player
    end
  end

  def cpu_rand_field
    x = rand(3)
    y = rand(3)

    until(@board[x][y].nil?)
      x = rand(3)
      y = rand(3)
    end

    @board[x][y] = 'CPU'
    @cpuLastMove = [x, y]
  end

  def cpu_move
    if !end? then
      cpu_rand_field
      set_next_player
    end
    is_player_winner
  end

  def player_move(x, y)
    @board[x][y] = 'Player'
    set_next_player

    is_cpu_winner
  end

  def is_player_winner
    if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] && @board[0][0] == 'Player' ||
       @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] == 'Player' ||
       @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] && @board[0][0] == 'Player' ||
       @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2] && @board[2][0] == 'Player' ||
       @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] && @board[2][0] == 'Player' ||
       @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] && @board[0][2] == 'Player' ||
       @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] && @board[0][1] == 'Player' ||
       @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] && @board[1][0] == 'Player'
    then
      @winner = 'Player'
      true
    else
      false
    end
  end

  def is_cpu_winner
    if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] && @board[0][0] == 'CPU' ||
       @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] == 'CPU' ||
       @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] && @board[0][0] == 'CPU' ||
       @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2] && @board[2][0] == 'CPU' ||
       @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] && @board[2][0] == 'CPU' ||
       @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] && @board[0][2] == 'CPU' ||
       @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] && @board[0][1] == 'CPU' ||
       @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] && @board[1][0] == 'CPU'
    then
      @winner = 'CPU'
      true
    else
      false
    end
  end
end