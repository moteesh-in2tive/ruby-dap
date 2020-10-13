# Arguments for ‘terminateThreads’ request.
class DAP::TerminateThreadsArguments < DAP::Base
  # Ids of threads to be terminated.
  property :threadIds, required: false, as: 'number[]'
end
