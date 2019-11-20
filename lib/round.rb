class Round
  attr_accessor :deck, :turns, :number_correct, :turn_number

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    # @turn_number = 0
  end

  def current_card
    self.deck.cards[self.turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    self.turns << new_turn

    if new_turn.correct?
      self.number_correct += 1
    end
    
    new_turn
  end
end
