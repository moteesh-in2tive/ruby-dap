module DAP
  class Request < ProtocolMessage
    def self.type
      'request'
    end

    property :command, :arguments
  end
end
