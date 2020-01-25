# frozen_string_literal: true

class Game
  STATUS = %i[go_on over].freeze
  OUTCOME = %i[win lose].freeze
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
  }.freeze

  attr_reader :name, :difficulty
  attr_reader :attempts_used, :hints_used
  attr_reader :status, :outcome

  def initialize(name = 'User1', difficulty = :easy, secret = Code.random)
    raise ArgumentError, 'No such difficulty' unless %i[easy medium hell].include? difficulty.to_s.to_sym
    raise ArgumentError, 'Incorrect username' unless name.to_s.match?(/^[0-9a-zA-Z]{3,20}$/)

    @name = name.to_s
    @difficulty = difficulty.to_sym

    @attempts_used = 0
    @hints_used = 0

    @status = :go_on
    @outcome = nil

    @code = Code.new(secret)
  end

  def attempts_total
    Game::DIFFICULTIES[difficulty][:attempts_total]
  end

  def hints_total
    Game::DIFFICULTIES[difficulty][:hints_total]
  end

  def attempt(attempt_code)
    case @status
    when :go_on
      @attempts_used += 1
      answer = @code.compare(attempt_code)
      check_win(answer)
      check_lose
      answer
    when :over
      raise StandardError 'The game is over.'
    end
  end

  private

  def check_win(answer)
    return unless answer.eql?('++++')

    @status = :over
    @outcome = :win
  end

  def check_lose
    return unless @attempts_used >= attempts_total

    @status = :over
    @outcome = :lose
  end
end
