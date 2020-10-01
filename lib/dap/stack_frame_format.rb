require_relative 'value_format'

class DAP::StackFrameFormat < DAP::ValueFormat
  # Displays parameters for the stack frame.
  property :parameters, required: false

  # Displays the types of parameters for the stack frame.
  property :parameterTypes, required: false

  # Displays the names of parameters for the stack frame.
  property :parameterNames, required: false

  # Displays the values of parameters for the stack frame.
  property :parameterValues, required: false

  # Displays the line number of the stack frame.
  property :line, required: false

  # Displays the module of the stack frame.
  property :module, required: false

  # Includes all stack frames, including those the debug adapter might otherwise hide.
  property :includeAll, required: false
end
