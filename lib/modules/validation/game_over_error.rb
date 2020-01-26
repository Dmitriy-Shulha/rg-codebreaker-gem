class GameOverError < StandardError
  def initialize(msg = 'The game is over.')
    super
  end
end
