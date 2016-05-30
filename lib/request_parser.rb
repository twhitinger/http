# iteration 1 create a hash
require './lib/server'


class RequestParser
  def initialize
    server = Server.new
    request_lines = server.request_lines
  end


end
