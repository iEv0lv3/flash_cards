class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.count
  end

  def cards_in_category(category)
    self.cards.select do |card|
      if card.category == category
        card
      end
    end
  end
end
