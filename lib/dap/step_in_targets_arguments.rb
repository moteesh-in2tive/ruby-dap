# Arguments for ‘stepInTargets’ request.
class DAP::StepInTargetsArguments < DAP::Base
  # The stack frame for which to retrieve the possible stepIn targets.
  property :frameId
end
