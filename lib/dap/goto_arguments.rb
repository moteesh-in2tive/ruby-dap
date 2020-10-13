# Arguments for ‘goto’ request.
class DAP::GotoArguments < DAP::Base
  # Set the goto target for this thread.
  property :threadId, as: 'number'

  # The location where the debuggee will continue to run.
  property :targetId, as: 'number'
end
