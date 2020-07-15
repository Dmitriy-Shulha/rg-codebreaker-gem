module Codebreaker
  module Validation
    class NoHintsError < StandardError
      def initialize(msg = 'No hints left.')
        super
      end
    end
  end
end
