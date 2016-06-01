require 'socket'
require 'pry'
require './lib/request_parser'
require './lib/path.rb'

class Server
  attr_reader :path, :client

  def start_server
    counter = 0
    tcp_server = TCPServer.new(9292)

    loop do
      @client = tcp_server.accept
      request = RequestParser.new(server_request)
      @path = Path.new(request.path,request.response,counter)

      output = "<html><head></head><body><pre>#{path.path_finder}</pre></body></html>"
      # html_wrapper(path)
      print_or_shutdown(output)
      counter += 1
      client.close
    end
  end

  def print_or_shutdown(output)
    headers = ["http/1.1 200 ok",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    client.puts headers
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

# server = Server.new
# server.start_server
