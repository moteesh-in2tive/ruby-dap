class DAP::Event < DAP::ProtocolMessage
  def self.type
    'event'
  end

  property :event, :body
end
