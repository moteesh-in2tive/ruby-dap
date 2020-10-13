# Arguments for ‘launch’ request. Additional attributes are implementation
# specific.
class DAP::LaunchRequestArguments < DAP::Base
  # If noDebug is true the launch request should launch the program without enabling debugging.
  property :noDebug, required: false, as: 'boolean'

  # Optional data from the previous, restarted session.
  # The data is sent as the 'restart' attribute of the 'terminated' event.
  # The client should leave the data intact.
  property :__restart, required: false
end
