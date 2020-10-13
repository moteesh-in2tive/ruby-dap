require_relative 'stepping_granularity'

# Arguments for ‘stepBack’ request.
class DAP::StepBackArguments < DAP::Base
  # Execute 'stepBack' for this thread.
  property :threadId

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
