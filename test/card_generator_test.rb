require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_deck_from_card_generator_exists
    new_deck = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, new_deck
  end

  def test_card_generator_has_file_name
    new_deck = CardGenerator.new('cards.txt')

    assert_equal 'cards.txt', new_deck.filename
  end
end
