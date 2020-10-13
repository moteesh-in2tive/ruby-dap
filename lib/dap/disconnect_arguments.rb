# Arguments for ‘disconnect’ request.
class DAP::DisconnectArguments < DAP::Base
  # A value of true indicates that this 'disconnect' request is part of a restart sequence.
  property :restart, required: false

  # Indicates whether the debuggee should be terminated when the debugger is disconnected.
  # If unspecified, the debug adapter is free to do whatever it thinks is best.
  # The attribute is only honored by a debug adapter if the capability 'supportTerminateDebuggee' is true.
  property :terminateDebuggee, required: false
end
