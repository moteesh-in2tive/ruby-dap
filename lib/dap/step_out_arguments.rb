require_relative 'stepping_granularity'

# Arguments for ‘stepOut’ request.
class DAP::StepOutArguments < DAP::Base
  # Execute 'stepOut' for this thread.
  property :threadId, as: 'number'

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
