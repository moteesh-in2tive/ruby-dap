module DAP
  class Event < ProtocolMessage
    def self.type
      'event'
    end

    property :event, :body
  end
end
