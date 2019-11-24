class Round
  attr_reader :deck, :turns
  attr_accessor :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn

    self.number_correct += 1 if new_turn.correct?

    puts new_turn.feedback
    new_turn
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.count
  end

  def percent_correct
    (number_correct / turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    total = 0

    turns.each do |turn|
      total += 1 if turn.card.category == category
    end

    (correct / total.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts '-------------------------------------------------'
    deck.cards.each do |card|
      puts "This is card number #{turns.count + 1} out of #{deck.count}"
      puts "Question: #{card.question}"

      guess = gets.chomp
      take_turn(guess)
    end

    puts '****** Game over! ******'
    puts "You had #{self.number_correct} out of #{turns.count} for a total score of #{percent_correct}."

    categories = []
    deck.cards.each do |card|
      if categories.include?(card.category) == false
        categories << card.category
      end
    end

    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}%"
    end
  end
end
