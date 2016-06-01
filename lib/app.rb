require './lib/server'

def start
  server = Server.new
  server.start_server
end
start
