module HtmlWrapper
  def self.wrap_response_in_html(response)
     "<html><head></head><body><pre>#{response}</pre></body></html>"
  end
end
