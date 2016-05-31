require './test/test_helper'
require './lib/path'

class PathTest < Minitest::Test

  def test_path_equals_root
    path = Path.new
    assert_equal "/", path.root
  end

  def test_path_equals_slash_hello
    skip
    path = Path.new
    assert_equal "/hello", path.hello
  end

  def test_path_equals_slash_datetime
    skip
    path = Path.new
    assert_equal "/datetime", path.datetime
  end

  def test_path_equals_slash_shutdown
    skip
    path = Path.new
    assert_equal "/shutdown", path.shutdown
  end
end
