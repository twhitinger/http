require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  attr_reader :game

  def setup
    @game ||= Game.new
  end

  def test_it_can_be_created

    assert_instance_of Game, game
  end

  def test_it_has_a_count

    assert_equal 0, game.count
  end

  def test_if_no_guess_last_guess_returns_nil

    assert_equal nil, game.last_guess
  end

  def test_if_no_guess_returns_nil

    assert_equal nil, game.guess
  end
end
