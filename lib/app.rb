require './lib/server'
class AppStart

  def start
    server = Server.new
    server.start_server
  end

end
# app_start = AppStart.new
# app_start.start
