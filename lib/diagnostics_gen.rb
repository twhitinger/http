# require 'socket'
# require 'pry'
# tcp_server = TCPServer.new(9292)
# client = tcp_server.accept
#
# request_lines = []
# while line = client.gets and !line.chomp.empty?
#   request_lines << line.chomp
# end
#
# puts "Got this request:"
# binding.pry
# puts request_lines.inspect
#
# puts "Sending response."
# response = "<pre>" + request_lines.join("\n") + "</pre>"
# output = "<html><head></head><body>#{response}</body></html>"
# headers = ["http/1.1 200 ok",
#           "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
#           "server: ruby",
#           "content-type: text/html; charset=iso-8859-1",
#           "content-length: #{output.length}\r\n\r\n"].join("\r\n")
# client.puts headers
# client.puts output
#
# puts ["Wrote this response:", headers, output].join("\n")
# client.close
# puts "\nResponse complete, exiting."


# iteration 1 have to parse the request_lines array first
class DiagnosticsGen
  # def output_diagnostic(request)
  #    "Verb: #{request['Verb']}\n" +
  #    "Path: #{request['Path']}\n" +
  #    "Protocol: #{request['Protocol']}\n" +
  #    "Host: #{request['Host']}\n" +
  #    "Port: #{request['Port']}\n" +
  #    "Origin: #{request['Origin']}\n" +
  #    "Accept: #{request['Accept']}\n"
  #  end
end
