RSpec.describe Game do
  describe "#username" do
    it 'needs formatted username ' do
      expect {Game.new("")}.to raise_error(ArgumentError)
      expect {Game.new("ThisIsWayTooLongUserName")}.to raise_error(ArgumentError)
    end
  end

  describe "#difficulties" do
    it 'forbid incorrect difficulties' do
      expect{ Game.new("Username", :easy) }.not_to raise_error
      expect{ Game.new("Username", :medium) }.not_to raise_error
      expect{ Game.new("Username", :hell) }.not_to raise_error

      expect{ Game.new("Username", "easy") }.not_to raise_error
      expect{ Game.new("Username", "medium") }.not_to raise_error
      expect{ Game.new("Username", "hell") }.not_to raise_error

      expect{ Game.new("Username", :some_other_difficulty) }.to raise_error(ArgumentError)
      expect{ Game.new("Username", nil) }.to raise_error(ArgumentError)
      expect{ Game.new("Username", 123) }.to raise_error(ArgumentError)

    end

    it "has 'easy' difficulty" do
      easy_game = Game.new("UserName", :easy)
      expect(easy_game.name).to eq("UserName")
      expect(easy_game.difficulty).to eq(:easy)

      expect(easy_game.attempts_total).to eq(15)
      expect(easy_game.hints_total).to eq(2)

      expect(easy_game.attempts).to eq(15)
      expect(easy_game.hints).to eq(2)

    end

    it "has 'medium' difficulty" do
      medium_game = Game.new("UserName", :medium)
      expect(medium_game.name).to eq("UserName")
      expect(medium_game.difficulty).to eq(:medium)

      expect(medium_game.attempts_total).to eq(10)
      expect(medium_game.hints_total).to eq(1)

      expect(medium_game.attempts).to eq(10)
      expect(medium_game.hints).to eq(1)
    end

    it "has 'hell' difficulty" do
      hell_game = Game.new("UserName", :hell)
      expect(hell_game.name).to eq("UserName")
      expect(hell_game.difficulty).to eq(:hell)

      expect(hell_game.attempts_total).to eq(5)
      expect(hell_game.hints_total).to eq(1)

      expect(hell_game.attempts).to eq(5)
      expect(hell_game.hints).to eq(1)
    end
  end
end
