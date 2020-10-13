require_relative 'source'

# Arguments for ‘gotoTargets’ request.
class DAP::GotoTargetsArguments < DAP::Base
  # The source location for which the goto targets are determined.
  property :source, as: DAP::Source

  # The line location for which the goto targets are determined.
  property :line, as: 'number'

  # An optional column location for which the goto targets are determined.
  property :column, required: false, as: 'number'
end
