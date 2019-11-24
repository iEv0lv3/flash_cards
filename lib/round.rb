class Round
  attr_accessor :deck, :turns, :number_correct, :turn_number

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    self.turns << new_turn

    if new_turn.correct?
      self.number_correct += 1
    end
    puts new_turn.feedback
    new_turn
  end

  def number_correct_by_category(category)
    category_correct = 0

    self.turns.select do |turn|
      if turn.card.category == category && turn.correct?
        category_correct += 1
      end
    end
    category_correct
  end

  # def number_correct_by_category(category)
  #
  #   self.turns.select do |turn|
  #     turn.card.category == category && turn.correct?
  #   end.count
  # end

  def percent_correct
    (self.number_correct.to_f / self.turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = self.number_correct_by_category(category)
    total = 0

    self.turns.each do |turn|
      if turn.card.category == category
        total += 1
      end
    end
    (correct.to_f / total.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{self.deck.count} cards."
    puts "--------------------------------------------------------------"
    self.deck.cards.each do |card|
      puts "This is card number #{self.turns.count + 1} out of #{self.deck.count}"
      puts "Question: #{card.question}?"

      guess = gets.chomp
      take_turn(guess)
    end

    puts "****** Game over! ******"
    puts "You had #{self.number_correct} out of #{self.turns.count} for a total score of #{self.percent_correct}."

    categories = []
    self.deck.cards.each do |card|
      if categories.include?(card.category) == false
        categories << card.category
      end
    end

    categories.each do |category|
      puts "#{category} - #{self.percent_correct_by_category(category)}%"
    end
  end
end
