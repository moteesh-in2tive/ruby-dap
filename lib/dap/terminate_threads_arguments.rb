class DAP::TerminateThreadsArguments < DAP::Base
  # Ids of threads to be terminated.
  property :threadIds, required: false
end
