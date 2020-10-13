# Base class of requests, responses, and events.
class DAP::ProtocolMessage < DAP::Base
  # Valid protocol message types.
  # @return [Hash<Symbol,Class>]
  def self.types
    @types ||= {
      request: DAP::Request,
      event: DAP::Event,
      response: DAP::Response,
    }
  end

  # Create a protocol message from attribute values.
  # @param values [Hash] the attribute values
  def self.from(values)
    build(values) do |v|
      key = v[:type]&.to_sym
      raise "#{name}.type missing" if key.nil?
      raise "Unknown #{name}.type #{key}" unless types.key?(key)

      types[key]
    end
  end

  # Sequence number (also known as message ID). For protocol messages of type
  # 'request' this ID can be used to cancel the request.
  property :seq, as: 'number'

  # Message type.
  property :type, as: 'string'

  # (see Base#initialize)
  def initialize(values)
    super(values)
    @seq = values[:seq] || DAP::ProtocolMessage.seq
    @type = self.class.type
  end

  private

  def self.seq
    @seq ||= 0
    @seq += 1
  end
end

require_relative 'request'
require_relative 'event'
require_relative 'response'
