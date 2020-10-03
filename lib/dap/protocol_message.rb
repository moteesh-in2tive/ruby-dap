class DAP::ProtocolMessage < DAP::Base
  def self.types
    @types ||= {
      request: DAP::Request,
      event: DAP::Event,
      response: DAP::Response,
    }
  end

  def self.from(values)
    build(values) do |v|
      key = v[:type]&.to_sym
      raise "#{name}.type missing" if key.nil?
      raise "Unknown #{name}.type #{key}" unless types.key?(key)

      types[key]
    end
  end

  property :seq, :type

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
