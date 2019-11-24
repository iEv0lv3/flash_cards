require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card2 = Card.new('The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?', 'Mars', :STEM)
    @card3 = Card.new('Describe in words the exact direction that is 697.5°
      clockwise from due north?', 'North north west', :STEM)

    @cards = [@card1, @card2, @card3]
  end

  def test_cards_exist
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
  end

  def test_cards_are_in_variable_array
    assert_equal @cards, [@card1, @card2, @card3]
  end

  def test_deck_exists_with_multiple_cards
    deck = Deck.new(@cards)
    assert_equal deck.cards, @cards
  end

  def test_deck_card_count
    deck = Deck.new(@cards)

    assert_equal 3, deck.count
  end

  def test_display_cards_in_category
    deck = Deck.new(@cards)

    assert deck.cards_in_category(:STEM)
    assert deck.cards_in_category(:Geography)
    assert deck.cards_in_category('Pop Culture')
  end
end
