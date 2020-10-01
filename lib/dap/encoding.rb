module DAP::Encoding
  CONTENT_LENGTH_HEADER = 'Content-Length'

  def self.decode(s)
    headers = {}

    loop do
      l = s.gets
      raise EOFError if l.nil?

      l = l.strip
      break if l.empty?

      name, value = l.split(':', 2)
      raise "Invalid header '#{l}'" unless value

      headers[name.strip] = value.strip
    end

    raise "No headers" unless headers.size
    raise "Missing content length" unless headers.key?(CONTENT_LENGTH_HEADER)

    cl = headers[CONTENT_LENGTH_HEADER].to_i
    raise "Invalid content length" unless cl.to_s == headers[CONTENT_LENGTH_HEADER]

    body = ''
    while body.size < cl do
      body += s.gets
    end

    raise "Body larger than content-length" if body.size > cl

    values = JSON.parse(body)
    DAP::ProtocolMessage.from(values)
  end

  def self.encode(message)
    raise "Body must be a protocol message" unless message.is_a? DAP::ProtocolMessage

    headers = {}

    body = JSON.dump(message.to_h) + "\r\n\r\n"
    headers[CONTENT_LENGTH_HEADER] = body.size

    headers.map { |name, value| "#{name}: #{value}\r\n" }.join + "\r\n" + body
  end

  def self.decode_all(s)
    loop do
      yield decode(s)
    end
  end
end
