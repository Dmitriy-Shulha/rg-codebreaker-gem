class NoHintsError < StandardError
  def initialize(msg = 'No hints left.')
    super
  end
end
