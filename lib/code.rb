class Code
  attr_reader :secret

  def initialize(secret=Code.random)
    raise ArgumentError unless secret.to_s.match? /^[1-6]{4}$/
    @secret = secret.to_s;
  end

  def compare(guess)
    return '++++' if @secret == guess
    return '' if (@secret.each_char.to_a & guess.each_char.to_a).empty?

    result = (0..3).map { |i| guess[i].eql?(@secret[i]) ? "+" : "" }

    remain_idx = (0..3).select { |i| result[i] != "+" }
    remain_guess = remain_idx.map { |i| guess[i] }
    remain_secret = remain_idx.map { |i| @secret[i] }

    intersection_with_duplicates =
        (remain_secret & remain_guess)
            .flat_map { |elem| [elem] * [remain_guess.count(elem), remain_secret.count(elem)].min }

    result.join << "-" * intersection_with_duplicates.size
  end

  def self.random
    (0..3).map{ rand(6) + 1}.map(&:to_s).join
  end
end
