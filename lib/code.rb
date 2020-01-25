class Code
  attr_reader :secret

  def initialize(secret = Code.random)
    raise ArgumentError unless secret.to_s.match?(/^[1-6]{4}$/)

    @secret = secret.to_s
  end

  def compare(guess)
    return '++++' if @secret == guess
    return '' if (@secret.each_char.to_a & guess.each_char.to_a).empty?

    bulls1, cows1 = bulls_and_cows(@secret, guess)
    bulls2, cows2 = bulls_and_cows(guess, @secret)

    '+' * [bulls1, bulls2].min + '-' * [cows1, cows2].min
  end

  def self.random
    (0..3).map { rand(1..6) }.map(&:to_s).join
  end

  private

  def bulls_and_cows(word1, word2)
    bulls = cows = 0
    word1.each_char.to_a.each_index do |index|
      if word2[index] == word1[index]
        bulls += 1
      elsif word2.include? word1[index]
        cows += 1
      end
    end
    [bulls, cows]
  end
end
