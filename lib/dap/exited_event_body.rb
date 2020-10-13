# The event indicates that the debuggee has exited and returns its exit code.
class DAP::ExitedEventBody < DAP::Base
  # The exit code returned from the debuggee.
  property :exitCode, as: 'number'
end
