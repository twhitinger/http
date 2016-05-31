require './html_wrapper'

class Path
  attr_reader :path
  def initialize(path)
    @path = path
  end

  if path == "/"
    root
  elsif path == "/hello"
    hello
  elsif path == "/datetime"
    datetime
  else
    shutdown
  end

  def root
    # @status_code = ok
    HtmlWrapper.wrap_response_in_html(request.response)
  end

  def hello
    # @count += 1
    # @status_code = ok
    # "Hello World! (#{@count})"
  end

  def datetime
    # @status_code = ok
    "#{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}"
  end

  def shutdown

  end

end
