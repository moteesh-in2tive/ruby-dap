require_relative 'message'

class DAP::ErrorResponseBody < DAP::Base
  # An optional, structured error message.
  property :error, as: DAP::Message
end
