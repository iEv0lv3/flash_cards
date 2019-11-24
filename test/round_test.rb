require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card2 = Card.new('The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?', 'Mars', :STEM)
    @card3 = Card.new('Describe in words the exact direction that is 697.5
      clockwise from due north?', 'North north west', :STEM)
  end

  def test_cards_exist
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
  end

  def test_deck_exists
    deck = Deck.new([@card1, @card2, @card3])

    assert_instance_of Deck, deck
  end

  def test_round_exists
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_has_no_turns
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    assert_empty round.turns
  end

  def test_current_card_is_deck_card1
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    assert_equal deck.cards[0], round.current_card
  end

  def test_take_turn_exists_and_guess_is_stored_with_turns
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    new_turn = round.take_turn('Juneau')

    assert_instance_of Turn, new_turn
    assert_equal 'Juneau', round.turns[0].guess
  end

  def test_new_turn_answer_is_correct_and_feedback_is_correct
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    new_turn = round.take_turn('Juneau')

    assert_equal true, new_turn.correct?
    assert_equal 'Correct!', new_turn.feedback
  end

  def test_correct_answer_adds_to_number_correct_total
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')

    assert_equal 1, round.number_correct
  end

  def test_current_card_is_changed_after_turn
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')

    assert_equal round.deck.cards[1], round.current_card
  end

  def test_can_take_additional_turns
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    new_turn2 = round.take_turn('Venus')

    assert_equal 'Venus', new_turn2.guess
  end

  def test_turns_count_equals_2_after_2_turns
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')
    assert_equal 2, round.turns.count
  end

  def test_last_feedback_for_turn_2_equals_incorrect
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    new_turn2 = round.take_turn('Venus')

    assert_equal 'Incorrect.', new_turn2.feedback
  end

  def test_number_correct_after_turn_2_is_equal_to_1
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    assert_equal 1, round.number_correct
  end

  def test_number_correct_by_category
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_percent_of_answers_correct
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    assert_equal 50.0, round.percent_correct
  end

  def test_percent_of_answers_correct_by_category
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_current_card_is_the_third_card_in_deck
    deck = Deck.new([@card1, @card2, @card3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    assert_equal round.deck.cards[2], round.current_card
  end
end
