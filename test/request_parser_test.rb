require './test/test_helper'
require './lib/request_parser'

class RequestParserTest < Minitest::Test

  attr_reader :parser
  def setup
    @parser = RequestParser.new(request)
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

    def test_it_returns_verb

      assert_equal "GET", parser.verb
    end

    def test_it_returns_path

      assert_equal "/", parser.path
    end

    def test_it_returns_protocol

      assert_equal "HTTP/1.1", parser.protocol
    end

    def test_it_returns_host

      assert_equal "127.0.0.1", parser.host
    end

    def test_it_returns_port

      assert_equal "9292", parser.port
    end

    def test_it_returns_origin

      assert_equal "127.0.0.1", parser.origin
    end

    def test_it_returns_accept

      assert_equal "*/*", parser.accept
    end

    def test_it_packages_response

      expected =
      "\nVerb: #{parser.verb}\n" +
      "Path: #{parser.path}\n" +
      "Protocol: #{parser.protocol}\n" +
      "Host: #{parser.host}\n" +
      "Port: #{parser.port}\n" +
      "Origin: #{parser.origin}\n" +
      "Accept: #{parser.accept}\n"
      assert_equal expected, parser.response
    end

    def test_response_to_hash

      assert_equal "/", parser.response_hash['Path']
      assert_equal "GET", parser.response_hash['Verb']
      assert_equal "HTTP/1.1", parser.response_hash['Protocol']
    end
  end
