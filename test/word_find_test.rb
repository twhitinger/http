require './test/test_helper'
require './lib/word_find'

class WordFindTest < Minitest::Test

  def test_method_find_returns_true
    word = WordFind.new

    assert word.find("word")
  end

  def test_return_value_of_excisting_word
    word = WordFind.new

    assert_equal "dog is a known word", word.exists("dog")
  end

  def test_return_value_of_unknown_word
    word = WordFind.new

    assert_equal "dragonissquare is not a known word", word.unknown("dragonissquare")
  end
end
