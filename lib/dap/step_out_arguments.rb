require_relative 'stepping_granularity'

class DAP::StepOutArguments < DAP::Base
  # Execute 'stepOut' for this thread.
  property :threadId

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
