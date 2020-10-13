require_relative 'stepping_granularity'

# Arguments for ‘next’ request.
class DAP::NextArguments < DAP::Base
  # Execute 'next' for this thread.
  property :threadId, as: 'number'

  # Optional granularity to step. If no granularity is specified, a granularity of 'statement' is assumed.
  property :granularity, required: false, as: DAP::SteppingGranularity
end
