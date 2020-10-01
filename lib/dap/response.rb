module DAP
  class Response < ProtocolMessage
    def self.type
      'response'
    end

    property :request_seq, :success, :command, :message, :body
  end
end
