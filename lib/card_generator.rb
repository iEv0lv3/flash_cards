# require './lib/card'

class CardGenerator
  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def add_cards
    File.open(self.filename).each do |data|
      line = data.strip.split(",")
      card = Card.new(line[0], line[1], line[2])
      self.cards << card
      require 'pry'; binding.pry
    end
  end
end
