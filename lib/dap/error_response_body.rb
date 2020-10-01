require_relative 'message'

class DAP::ErrorResponseBody < DAP::Base
  # An optional, structured error message.
  property :error, required: false, as: DAP::Message
end
