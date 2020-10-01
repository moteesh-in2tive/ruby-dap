require_relative 'source'

class DAP::Breakpoint < DAP::Base
  # An optional identifier for the breakpoint. It is needed if breakpoint events are used to update or remove breakpoints.
  property :id, required: false

  # If true breakpoint could be set (but not necessarily at the desired location).
  property :verified

  # An optional message about the state of the breakpoint.
  # This is shown to the user and can be used to explain why a breakpoint could not be verified.
  property :message, required: false

  # The source where the breakpoint is located.
  property :source, required: false, as: DAP::Source

  # The start line of the actual range covered by the breakpoint.
  property :line, required: false

  # An optional start column of the actual range covered by the breakpoint.
  property :column, required: false

  # An optional end line of the actual range covered by the breakpoint.
  property :endLine, required: false

  # An optional end column of the actual range covered by the breakpoint.
  # If no end line is given, then the end column is assumed to be in the start line.
  property :endColumn, required: false

  # An optional memory reference to where the breakpoint is set.
  property :instructionReference, required: false

  # An optional offset from the instruction reference.
  # This can be negative.
  property :offset, required: false
end
