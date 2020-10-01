class DAP::GotoArguments < DAP::Base
  # Set the goto target for this thread.
  property :threadId

  # The location where the debuggee will continue to run.
  property :targetId
end
