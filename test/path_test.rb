require './test/test_helper'
require './lib/path'
require './lib/server'
require './lib/request_parser'
require 'faraday'


class PathTest < Minitest::Test
  def setup
    @parser = RequestParser.new(request).path

  end

  def request
    ["GET / HTTP/1.1",
      "Host: 127.0.0.1:9292",
      "Connection: keep-alive",
      "Cache-Control: no-cache",
      "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.63 Safari/537.36",
      "Postman-Token: d0f12060-b586-0eb0-c11a-3e0d07903a76",
      "Accept: */*",
      "Accept-Encoding: gzip, deflate, sdch",
      "Accept-Language: en-US,en;q=0.8"]
    end

    def test_path_equals_root
      path = Path.new("/", @parser, 0)

      assert_equal "/", path.root
    end
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

    # def test_faraday
    #   # conn = Faraday.new(:url => 'http://127.0.0.1:9292/shutdown')
    #   response = Faraday.get 'http://127.0.0.1:9292'
    #
    # end
  end
