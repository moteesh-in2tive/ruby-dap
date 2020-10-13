require_relative 'goto_target'

# Response to ‘gotoTargets’ request.
class DAP::GotoTargetsResponseBody < DAP::Base
  # The possible goto targets of the specified location.
  property :targets
end
