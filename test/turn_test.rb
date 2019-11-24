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

  def test_card_and_guess_are_linked_with_turn
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal card, turn.card
    assert_equal 'Juneau', turn.guess
  end

  def test_guess_is_correct
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal true, turn.correct?
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
