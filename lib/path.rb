require "./lib/word_find"
require './lib/request_parser'
require './lib/game'

require "pry"

class Path
  attr_reader :path, :request, :full_request, :game, :status_code, :number_guess
  attr_accessor :counter, :number_guess
  def initialize(path, request, full_request, number_guess, counter)
    @path = path
    @request = request
    @full_request = full_request
    @counter = counter
    @status_code = "200 OK"
    @number_guess = number_guess

  end

  def path_finder(path = "/")
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
    elsif path == "/start_game" && full_request.verb == "POST"
      # @status_code = '302 Found'
      @game ||= Game.new
      "Good luck!"
    elsif full_request.verb == "GET" && path == "/game"
      game.summary
    elsif full_request.verb == "POST" && path == "/game"
      game.guess_check(number_guess)
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

  def word_find(word)
    counter += 1
    WordFind.new.find(word)
  end
end
