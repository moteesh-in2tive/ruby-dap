require_relative 'message'

# On error (whenever ‘success’ is false), the body can provide more details.
class DAP::ErrorResponseBody < DAP::Base
  # An optional, structured error message.
  property :error, required: false, as: DAP::Message
end
