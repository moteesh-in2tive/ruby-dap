require_relative 'goto_target'

class DAP::GotoTargetsResponseBody < DAP::Base
  # The possible goto targets of the specified location.
  property :targets, as: many(DAP::GotoTarget)
end
