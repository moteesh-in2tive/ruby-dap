class DAP::ContinuedEventBody < DAP::Base
  # The thread which was continued.
  property :threadId

  # If 'allThreadsContinued' is true, a debug adapter can announce that all threads have continued.
  property :allThreadsContinued, required: false
end
