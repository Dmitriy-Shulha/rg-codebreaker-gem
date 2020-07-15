module Codebreaker
  module Validation
    class GameOverError < StandardError
      def initialize(msg = 'The game is over.')
        super
      end
    end
  end
end
