# A StepInTarget can be used in the ‘stepIn’ request and determines into which
# single target the stepIn request should step.
class DAP::StepInTarget < DAP::Base
  # Unique identifier for a stepIn target.
  property :id

  # The name of the stepIn target (shown in the UI).
  property :label
end
