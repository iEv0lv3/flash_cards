require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    new_deck = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, new_deck
  end

  def test_card_generator_has_file_name
    new_deck = CardGenerator.new("cards.txt")

    assert_equal "cards.txt", new_deck.filename
  end

  def test_add_cards_opens_file_and_adds_cards
    new_deck = CardGenerator.new("cards.txt")
    
    assert new_deck.add_cards
  end
end
