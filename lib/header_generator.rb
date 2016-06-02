module HeaderGenerator

  def self.redirect_request(request, output, path)

    # need to find out how to return status code,second param
    generate_output(output, path.status_code)
  end

  def self.generate_output(output, status_code = "200 OK")
    # @output = generate_html(output)
    generate_header(output.length, status_code)
  end

  def self.generate_header(output_length, status_code)
    headers(output_length, status_code)
  end

  def self.headers(output_length, status_code)
    headers = header_template(status_code, output_length)
    headers.insert(2, location) if status_code == '302 Found'
    headers.join("\r\n")
  end

  def self.location
    "Location: http://127.0.0.1:9292/game\r\n"
  end

  def self.header_template(status_code, output_length)
    ["HTTP/1.1 #{status_code}",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: #{output_length}\r\n\r\n"]
  end

end
