require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def test_exists
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_card_is_linked_to_turn
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal card, turn.card
  end

  def test_turn_has_guess
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    refute_empty turn.guess
  end

  def test_guess_is_correct
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal true, turn.guess == card.answer
  end

  def test_feedback_for_correct_answer
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal true, turn.correct?
    assert_equal 'Correct!', turn.feedback
  end

  def test_feedback_for_incorrect_answer
    card = Card.new('Which planet is closest tothe sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    assert_equal false, turn.correct?
    assert_equal 'Incorrect.', turn.feedback
  end
end
