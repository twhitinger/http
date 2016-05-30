require 'socket'
require 'pry'


# iteration 0
class Server

  def start_server
    counter = 0
    tcp_server = TCPServer.new(9292)

    loop do
      @client = tcp_server.accept
      server_request
      response = "<pre>" + "Hello, World! (#{counter})" + "</pre>"
      output = "<html><body>#{response}</body></html>"
      @client.puts output
      counter += 1
      @client.close
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
