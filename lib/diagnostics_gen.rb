# <pre>
# Verb: POST
# Path: /
# Protocol: HTTP/1.1
# Host: 127.0.0.1
# Port: 9292
# Origin: 127.0.0.1
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# </pre>

# ["GET / HTTP/1.1",
#  "Host: 127.0.0.1:9292",
#  "Connection: keep-alive",
#  "Cache-Control: no-cache",
#  "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.63 Safari/537.36",
#  "Postman-Token: d0f12060-b586-0eb0-c11a-3e0d07903a76",
#  "Accept: */*",
#  "Accept-Encoding: gzip, deflate, sdch",
#  "Accept-Language: en-US,en;q=0.8"]


# iteration 1 have to parse the request_lines array first
class DiagnosticsGen
  # def output_diagnostic(request)
    #  "Verb: #{request['Verb']}\n" +
    #  "Path: #{request['Path']}\n" +
    #  "Protocol: #{request['Protocol']}\n" +
  #    "Host: #{request['Host']}\n" +
  #    "Port: #{request['Port']}\n" +
  #    "Origin: #{request['Origin']}\n" +
  #    "Accept: #{request['Accept']}\n"
  #  end
end
