require_relative 'value_format'

class DAP::StackFrameFormat < DAP::ValueFormat
  # Displays parameters for the stack frame.
  property :parameters

  # Displays the types of parameters for the stack frame.
  property :parameterTypes

  # Displays the names of parameters for the stack frame.
  property :parameterNames

  # Displays the values of parameters for the stack frame.
  property :parameterValues

  # Displays the line number of the stack frame.
  property :line

  # Displays the module of the stack frame.
  property :module

  # Includes all stack frames, including those the debug adapter might otherwise hide.
  property :includeAll
end
