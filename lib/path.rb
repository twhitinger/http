require './lib/html_wrapper'


class Path
  attr_reader :path, :request
  def initialize(path,request,counter)
    @path = path
    @request = request
    @counter = counter
  end

  def path_finder
    if path == "/"
      root
    elsif path == "/hello"
      hello
    elsif path == "/datetime"
      datetime
    else
      shutdown
    end
  end

  def root
    # @status_code = ok
  request
  end

  def hello
    # @status_code = ok
    "Hello World!(#{@counter})"
  end

  def datetime
    # @status_code = ok
    "#{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}"
  end

  def shutdown

   "Total Requests: #{@counter}"
  end

end
