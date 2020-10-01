require_relative 'stepping_granularity'

class DAP::StepInArguments < DAP::Base
  # Execute 'stepIn' for this thread.
  property :threadId

  # Optional id of the target to step into.
  property :targetId

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, as: DAP::SteppingGranularity
end
