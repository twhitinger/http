require 'socket'
require 'pry'
require './request_parser'
require './html_wrapper'
require './path.rb'

class Server

  def start_server
    counter = 0
    tcp_server = TCPServer.new(9292)

    loop do
      @client = tcp_server.accept
      request = RequestParser.new(server_request)
      path = Path.new(request.path,request.response,counter)
      print_or_shutdown(path)
      counter += 1
      @client.close
    end
  end

  def print_or_shutdown(path)
    if path.path_finder == path.shutdown
      @client.puts path.path_finder
      exit
    else
      @client.puts path.path_finder
    end
  end

  def server_request
    request_lines = []
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end
end

server = Server.new
server.start_server
