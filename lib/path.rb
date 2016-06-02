require "./lib/word_find"
require './lib/request_parser'

require "pry"

class Path
  attr_reader :path, :request, :full_request, :thing, :game
  def initialize(path, request, counter, full_request)
    @path = path
    @request = request
    @counter = counter
    @full_request = full_request
    @thing = thing
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
    # elsif path == "/game" && full_request.verb == "GET"
    #   play_game
    # elsif path == "/game" && full_request.verb == "POST"
    #   play_game
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
  # all after this should be in game
  # def start_game
  #   @game = Game.new
  #   "Good luck!"
  # end

  # def play_game(thing = 0)
  #   if path == "/start_game"
  #     @game = Game.new
  #     "Good luck!"
  #   elsif full_request.verb == "GET"
  #
  #     game.guess_check(thing)
  #   elsif full_request.verb == "POST"
  #
  #     game.guess_check(thing)
  #   end
  # end

  end
