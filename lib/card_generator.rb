require './lib/card'

class CardGenerator
  attr_reader :filename, :cards_array

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards_array = []
    File.open(filename).each do |data|
      line = data.strip.split(',')
      card = Card.new(line[0], line[1], line[2])
      cards_array << card
    end
    cards_array
  end
end
