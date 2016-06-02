require 'socket'
require 'pry'
require './lib/request_parser'
require './lib/path.rb'
require './lib/game'
require './lib/header_generator'
require './lib/html_wrapper'

class Server
  attr_reader :path, :client, :request, :game, :number_guess, :header

  def start_server
    counter = 0
    tcp_server = TCPServer.new(9292)

    loop do
      @client = tcp_server.accept
      @request = RequestParser.new(server_request)
      redirect_game(request)
      @path = Path.new(request.path,request.response,counter,request)
      output = HtmlWrapper.wrap_response_in_html(path.path_finder)
      header = HeaderGenerator.redirect_request(request,output,path)
      @header = header
      print_or_shutdown(output,header)
      counter += 1
      client.close
    end
  end

  def redirect_game(request)
    if request.path == "/game" && request.verb == "POST"
      @number_guess = client.read(request.accept.to_i)
    else
      @number_guess = 0
    end
    play_game(number_guess,request) if request.path == "/start_game" || request.path == "/game"
  end

  def play_game(number_guess,request)
    if request.path == "/start_game"
      @game = Game.new
    elsif request.verb == "GET"
      print_or_shutdown(HtmlWrapper.wrap_response_in_html(game.guess_check(number_guess)))
    elsif request.verb == "POST"
      print_or_shutdown(HtmlWrapper.wrap_response_in_html(game.guess_check(number_guess)))
    end
  end

  def print_or_shutdown(output,header = @header)
    client.puts header
    client.puts output
    exit if path.path_finder == path.shutdown
  end

  def server_request
    request_lines = []
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end
end
