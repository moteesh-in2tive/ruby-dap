# Encoding and decoding for DAP messages
module DAP::Encoding
  # The name of the content length header.
  CONTENT_LENGTH_HEADER = 'Content-Length'

  # Decode a DAP message from the stream.
  # @param s [IO] the stream
  # @return [ProtocolMessage] the message
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

    body = s.read(cl)
    values = JSON.parse(body)
    DAP::ProtocolMessage.from(values)
  end

  # Encode a DAP message to a string.
  # @param message [ProtocolMessage] the message
  # @return [String] the encoded message
  def self.encode(message)
    raise "Body must be a protocol message" unless message.is_a? DAP::ProtocolMessage

    headers = {}

    body = JSON.dump(message.to_wire)
    headers[CONTENT_LENGTH_HEADER] = body.bytesize

    headers.map { |name, value| "#{name}: #{value}\r\n" }.join + "\r\n" + body
  end

  # Decode all DAP messages from the stream.
  # @param s [IO] the stream
  # @yield Invokes the block for each message
  def self.decode_all(s)
    loop do
      yield decode(s)
    end
  end
end
