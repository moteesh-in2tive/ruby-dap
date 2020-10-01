class DAP::AttachRequestArguments < DAP::Base
  # Optional data from the previous, restarted session.
  # The data is sent as the 'restart' attribute of the 'terminated' event.
  # The client should leave the data intact.
  property :__restart
end
