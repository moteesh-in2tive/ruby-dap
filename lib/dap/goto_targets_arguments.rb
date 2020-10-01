require_relative 'source'

class DAP::GotoTargetsArguments < DAP::Base
  # The source location for which the goto targets are determined.
  property :source, as: DAP::Source

  # The line location for which the goto targets are determined.
  property :line

  # An optional column location for which the goto targets are determined.
  property :column
end
