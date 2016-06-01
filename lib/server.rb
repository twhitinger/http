require 'socket'
require 'pry'
require './request_parser'
require './html_wrapper'
require './path.rb'


# iteration 0
class Server

  def start_server
    counter = 0
    tcp_server = TCPServer.new(9292)

    loop do
      @client = tcp_server.accept
      # response = "<pre>" + "Hello, World! (#{counter})" + "</pre>"
      # output = "<html><body>#{response}</body></html>"
      request = RequestParser.new(server_request)
      path = Path.new(request.path,request.response,counter)

      # path = request.response_hash['Path']
      # output = Path.new(path)
      @client.puts path.path_finder

      # output(counter)
      counter += 1
      @client.close
    end
  end

  # def output(request)
  #   response = "<pre> #{request} </pre>"
  #   "<html><body>#{response}</body></html>"
  # end

  # def output(count)
  #   response = "<pre>" + "Hello, World! (#{count})" + "</pre>"
  #   "<html><body>#{response}</body></html>"
  # end

  def server_request
    request_lines = []
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end



end
#
server = Server.new
server.start_server
