require_relative 'stepping_granularity'

# Arguments for ‘stepIn’ request.
class DAP::StepInArguments < DAP::Base
  # Execute 'stepIn' for this thread.
  property :threadId

  # Optional id of the target to step into.
  property :targetId, required: false

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
