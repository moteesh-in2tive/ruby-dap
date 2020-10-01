require_relative 'step_in_target'

class DAP::StepInTargetsResponseBody < DAP::Base
  # The possible stepIn targets of the specified source location.
  property :targets, as: many(DAP::StepInTarget)
end
