require_relative 'source'

class DAP::StackFrame < DAP::Base
  # An identifier for the stack frame. It must be unique across all threads.
  # This id can be used to retrieve the scopes of the frame with the 'scopesRequest' or to restart the execution of a stackframe.
  property :id

  # The name of the stack frame, typically a method name.
  property :name

  # The optional source of the frame.
  property :source, required: false, as: DAP::Source

  # The line within the file of the frame. If source is null or doesn't exist, line is 0 and must be ignored.
  property :line

  # The column within the line. If source is null or doesn't exist, column is 0 and must be ignored.
  property :column

  # An optional end line of the range covered by the stack frame.
  property :endLine, required: false

  # An optional end column of the range covered by the stack frame.
  property :endColumn, required: false

  # Optional memory reference for the current instruction pointer in this frame.
  property :instructionPointerReference, required: false

  # The module associated with this frame, if any.
  property :moduleId, required: false

  # An optional hint for how to present this frame in the UI.
  # A value of 'label' can be used to indicate that the frame is an artificial frame that is used as a visual label or separator. A value of 'subtle' can be used to change the appearance of a frame in a 'subtle' way.
  # Values: 'normal', 'label', 'subtle', etc.
  property :presentationHint, required: false # 'normal' | 'label' | 'subtle'
end
