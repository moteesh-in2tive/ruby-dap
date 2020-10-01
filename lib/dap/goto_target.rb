class DAP::GotoTarget < DAP::Base
  # Unique identifier for a goto target. This is used in the goto request.
  property :id

  # The name of the goto target (shown in the UI).
  property :label

  # The line of the goto target.
  property :line

  # An optional column of the goto target.
  property :column

  # An optional end line of the range covered by the goto target.
  property :endLine

  # An optional end column of the range covered by the goto target.
  property :endColumn

  # Optional memory reference for the instruction pointer value represented by this target.
  property :instructionPointerReference
end
