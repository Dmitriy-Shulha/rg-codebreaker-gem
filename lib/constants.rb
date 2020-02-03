module Codebreaker
  STATUS = %i[go_on over].freeze
  OUTCOME = %i[win lose].freeze
  DIFFICULTIES = {
      easy: {
          score: 200,
          attempts_total: 15,
          hints_total: 2
      },
      medium: {
          score: 400,
          attempts_total: 10,
          hints_total: 1
      },
      hell: {
          score: 600,
          attempts_total: 5,
          hints_total: 1
      }
  }.freeze
end
