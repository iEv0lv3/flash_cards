class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    self.guess == card.answer
  end

  def feedback
    if self.guess == card.answer
      "Correct!"
    elsif self.guess != card.answer
      "Incorrect."
    end
  end
end
