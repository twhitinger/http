require 'socket'
require './lib/request_parser'
require './lib/path.rb'
require './lib/header_generator'
require './lib/html_wrapper'

class Server
  attr_reader :path, :client, :request, :number_guess, :header, :tcp_server

  def initialize(start = false)
    @tcp_server = TCPServer.new(9292) if start
  end

  def start_server
    counter = 0

    loop do

      @client = tcp_server.accept
      @request = RequestParser.new(server_request)
      @path ||= Path.new(request.path,request.response,request,number_guess = nil,counter)
      path.full_request = request
      number_guess = redirect_game(request) if request.path == "/game" && request.verb == "POST"
      path.number_guess = number_guess if request.path == "/game" && request.verb == "POST"
      output = HtmlWrapper.wrap_response_in_html(path.path_finder(request.path))
      header = HeaderGenerator.redirect_request(request,output,path)
      print_or_shutdown(output,header)
      counter += 1
      path.counter = counter
      client.close
    end
  end

  def redirect_game(request)
    client.read(request.accept.to_i)
  end

  def print_or_shutdown(output,header)
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


if __FILE__==$0
  s = Server.new(true)
  s.start_server
end
