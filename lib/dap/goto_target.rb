# A GotoTarget describes a code location that can be used as a target in the
# ‘goto’ request. The possible goto targets can be determined via the
# ‘gotoTargets’ request.
class DAP::GotoTarget < DAP::Base
  # Unique identifier for a goto target. This is used in the goto request.
  property :id

  # The name of the goto target (shown in the UI).
  property :label

  # The line of the goto target.
  property :line

  # An optional column of the goto target.
  property :column, required: false

  # An optional end line of the range covered by the goto target.
  property :endLine, required: false

  # An optional end column of the range covered by the goto target.
  property :endColumn, required: false

  # Optional memory reference for the instruction pointer value represented by this target.
  property :instructionPointerReference, required: false
end
