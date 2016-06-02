require "./lib/word_find"
require './lib/request_parser'

require "pry"

class Path
  attr_reader :path, :request, :full_request, :thing, :game, :status_code
  def initialize(path, request, counter, full_request)
    @path = path
    @request = request
    @counter = counter
    @full_request = full_request
    @thing = thing
    @status_code = "200 OK"
  end

  def path_finder

    if path == "/"
      root
    elsif path == "/hello"
      hello
    elsif path == "/datetime"
      datetime
    elsif path == "/shutdown"
      shutdown
    elsif path == "/word_search=#{path.split("=")[1]}"
      word_find(path.split("=")[1])
    elsif path == "/start_game"
      "Good luck!"
    end
  end

  def root
    # @status_code = ok
    request
  end

  def hello
    # @status_code = ok
    "Hello World!(#{@counter})"
  end

  def datetime
    # @status_code = ok
    "#{Time.now.strftime('%l:%M %p on %A, %B %e, %Y')}"
  end

  def shutdown
    "Total Requests: #{@counter}"
  end

end
