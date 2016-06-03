require './test/test_helper'
require './lib/request_parser'
require './lib/path'
require './lib/game'

class PathTest < Minitest::Unit::TestCase

  def setup
    @parser = RequestParser.new(request).path
  end

  def test_faraday_hello_path
    response = Faraday.get 'http://127.0.0.1:9292/hello'
    output = "Hello World!(1)"
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
  end

  def test_path_equals_slash_word_search
    path = Path.new("/word_search=finish", @parser, full_request = nil, number_guess = 0, counter = 0)

    assert_equal "FINISH is a known word.", path.word_find("finish")
  end


  def test_faraday_root_path
    response = Faraday.get 'http://127.0.0.1:9292/'
    output =     "\nVerb: GET\n" +
        "Path: /datetime\n" +
        "Protocol: HTTP/1.1\n" +
        "Host: Faradayv0.9.2\n" +
        "Port: \n" +
        "Origin: Faradayv0.9.2\n" +
        "Content-length: */*\n"
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
  end

  def test_faraday_datetime_path
    response = Faraday.get 'http://127.0.0.1:9292/datetime'
    output = "#{Time.now.strftime('%l:%M %p on %A, %B %e, %Y')}"
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
  end

  def test_faraday_word_search_path
    response = Faraday.get 'http://127.0.0.1:9292/word_search=dog'
    output = "DOG is a known word."
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
  end

  def test_faraday_word_shutdown_path
    response = Faraday.get 'http://127.0.0.1:9292/shutdown'
    output = "Total Requests: 5"
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
  end


  def test_faraday_word_404
    response = Faraday.get 'http://127.0.0.1:9292/thedragonisreal'
    output = "404 Not Found"
    output_formatted = "<html><head></head><body><pre>#{output}</pre></body></html>"

    assert_equal output_formatted, response.body
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
      path = Path.new("/", @parser, full_request = nil, number_guess = 0, counter = 0)

      assert_equal "/", path.root
    end

    def test_path_equals_slash_hello
      path = Path.new("/hello", @parser, full_request = nil, number_guess = 0, counter = 0)

      assert_equal "Hello World!(0)", path.hello
    end

    def test_path_equals_slash_datetime
      path = Path.new("/datetime", @parser, full_request = nil, number_guess = 0, counter = 0)

      assert_equal "#{Time.now.strftime('%l:%M %p on %A, %B %e, %Y')}", path.datetime
    end

    def test_path_equals_slash_shutdown
      path = Path.new("/shutdown", @parser, full_request = nil, number_guess = 0, counter = 0)

      assert_equal "Total Requests: 0", path.shutdown
    end
    i_suck_and_my_tests_are_order_dependent!
  end
