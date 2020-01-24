class Game

  DIFFICULTIES = {
      easy: {
          attempts_total: 15,
          hints_total: 2
      },
      medium: {
          attempts_total: 10,
          hints_total: 1
      },
      hell: {
          attempts_total: 5,
          hints_total: 1
      }
  }

  attr_reader :name, :difficulty
  attr_reader :attempts, :hints

  def initialize(name = "User1", difficulty=:easy)
    raise ArgumentError, 'No such difficulty' unless [:easy, :medium, :hell].include? difficulty.to_s.to_sym
    raise ArgumentError, 'Incorrect username: 3 to 20 characters or digits' unless name.to_s.match? /^[0-9a-zA-Z]{3,20}$/

    @name = name.to_s
    @difficulty = difficulty.to_sym

    @attempts = attempts_total.clone
    @hints = hints_total.clone

    @code = Code.new("1234")
  end

  def attempts_total
    Game::DIFFICULTIES[difficulty][:attempts_total]
  end

  def hints_total
    Game::DIFFICULTIES[difficulty][:hints_total]
  end
end

