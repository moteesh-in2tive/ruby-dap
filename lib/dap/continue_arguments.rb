class DAP::ContinueArguments < DAP::Base
  # Continue execution for the specified thread (if possible).
  # If the backend cannot continue on a single thread but will continue on all threads, it should set the 'allThreadsContinued' attribute in the response to true.
  property :threadId
end
