require "./lib/word_find"
require "pry"

class Path
  attr_reader :path, :request
  def initialize(path,request,counter = 0)
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
    elsif path == "/shutdown"
      shutdown
    elsif path == "/word_search=#{path.split("=")[1]}"
      word_find(path.split("=")[1])
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
    "#{Time.now.strftime('%l:%M %p on %A, %B %e, %Y')}"
  end

  def shutdown
   "Total Requests: #{@counter}"
  end

  def word_find(word)
    WordFind.new.find(word)
  end

end
