class RequestParser
  attr_reader :request
  def initialize(request)
    @request = request
  end

  def verb
    request[0].split(" ")[0]
  end

  def path
    request[0].split(" ")[1]
  end

  def protocol
    request[0].split(" ")[2]
  end

  def host
    request[1].gsub(/\s+/, "").split(":")[1]
  end

  def port
    request[1].gsub(/\s+/, "").split(":")[2]
  end

  def origin
    request[1].gsub(/\s+/, "").split(":")[1]
  end

  def accept
    request[3].split(":")[1].strip
  end

  def response
    "\nVerb: #{verb}\n" +
    "Path: #{path}\n" +
    "Protocol: #{protocol}\n" +
    "Host: #{host}\n" +
    "Port: #{port}\n" +
    "Origin: #{origin}\n" +
    "Content-length: #{accept}\n"
  end
end
