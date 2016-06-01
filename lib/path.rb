require './html_wrapper'
require './request_parser'

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
    HtmlWrapper.wrap_response_in_html(request)
  end

  def hello
    # @status_code = ok
    HtmlWrapper.wrap_response_in_html("Hello World!(#{@counter})")
  end

  def datetime
    # @status_code = ok
    HtmlWrapper.wrap_response_in_html("#{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}")
  end

  def shutdown

   HtmlWrapper.wrap_response_in_html("Total Requests: #{@counter}")
  end

end
