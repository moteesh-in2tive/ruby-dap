# Arguments for ‘reverseContinue’ request.
class DAP::ReverseContinueArguments < DAP::Base
  # Execute 'reverseContinue' for this thread.
  property :threadId, as: 'number'
end
