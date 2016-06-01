require './test/test_helper'
require './lib/path'
require './lib/server'
require 'faraday'


class PathTest < Minitest::Test
  #
  # def test_path_equals_root
  #   path = Path.new
  #   assert_equal "/", path.root
  # end
  #
  # def test_path_equals_slash_hello
  #   skip
  #   path = Path.new
  #   assert_equal "/hello", path.hello
  # end
  #
  # def test_path_equals_slash_datetime
  #   skip
  #   path = Path.new
  #   assert_equal "/datetime", path.datetime
  # end
  #
  # def test_path_equals_slash_shutdown
  #   skip
  #   path = Path.new
  #   assert_equal "/shutdown", path.shutdown
  # end

  def test_faraday


    # conn = Faraday.new(:url => 'http://127.0.0.1:9292/shutdown')
    response = Faraday.get 'http://127.0.0.1:9292'
    binding.pry
  end
end
