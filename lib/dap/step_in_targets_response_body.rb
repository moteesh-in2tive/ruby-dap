require_relative 'step_in_target'

# Response to ‘stepInTargets’ request.
class DAP::StepInTargetsResponseBody < DAP::Base
  # The possible stepIn targets of the specified source location.
  property :targets
end
