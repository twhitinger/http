require "./lib/word_find"
require './lib/request_parser'
require './lib/game'

class Path
  attr_reader  :request, :game, :status_code, :number_guess, :path
  attr_accessor :counter, :number_guess, :full_request

  def initialize(path, request, full_request, number_guess, counter)
    @path         = path
    @request      = request
    @full_request = full_request
    @counter      = counter
    @status_code  = "200 OK"
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
      @status_code = '403 Forbidden' if @game
      @game ||= Game.new
      @status_code = '302 Found'
    elsif full_request.verb == "GET" && path == "/game"
      @status_code = '200 OK'
      game.summary
    elsif full_request.verb == "POST" && path == "/game"
      @status_code = '302 Found'
      game.guess_check(number_guess)
    elsif path == "/force_error"
      @status_code = '500 Internal Server Error'
      get_path_error
    else
      @status_code = '404 Not Found'
    end
  end

  def get_path_error
    raise SystemError
  rescue => detail
    detail.backtrace.join("\n")
  end

  def root
    request
  end

  def hello
    "Hello World!(#{@counter})"
  end

  def datetime
    "#{Time.now.strftime('%l:%M %p on %A, %B %e, %Y')}"
  end

  def shutdown
    "Total Requests: #{@counter}"
  end

  def word_find(word)
    WordFind.new.find(word)
  end
end
