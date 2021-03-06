require_relative 'stepping_granularity'

# Arguments for ‘stepIn’ request.
class DAP::StepInArguments < DAP::Base
  # Execute 'stepIn' for this thread.
  property :threadId, as: 'number'

  # Optional id of the target to step into.
  property :targetId, required: false, as: 'number'

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
