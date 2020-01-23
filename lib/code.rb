class Code
  attr_reader :secret

  def initialize(secret)
    @secret = secret;
  end

  def compare(guess)
    return '++++' if secret == guess
    return '' if (secret.each_char.to_a & guess.each_char.to_a).empty?

    places = (0..3).map { |i| guess[i].eql?(secret[i]) ? "+" : "" }

    remain_idx = (0..3).select { |i| places[i] != "+" }
    remain_guess = remain_idx.map { |i| guess[i] }
    remain_secret = remain_idx.map { |i| secret[i] }

    intersection_with_duplicates =
        (remain_secret & remain_guess)
            .flat_map { |elem| [elem] * [remain_guess.count(elem), remain_secret.count(elem)].min }

    places.join << "-" * intersection_with_duplicates.size
  end
end
