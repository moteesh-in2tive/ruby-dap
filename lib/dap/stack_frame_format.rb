require_relative 'value_format'

# Provides formatting information for a stack frame.
class DAP::StackFrameFormat < DAP::ValueFormat
  # Displays parameters for the stack frame.
  property :parameters, required: false, as: 'boolean'

  # Displays the types of parameters for the stack frame.
  property :parameterTypes, required: false, as: 'boolean'

  # Displays the names of parameters for the stack frame.
  property :parameterNames, required: false, as: 'boolean'

  # Displays the values of parameters for the stack frame.
  property :parameterValues, required: false, as: 'boolean'

  # Displays the line number of the stack frame.
  property :line, required: false, as: 'boolean'

  # Displays the module of the stack frame.
  property :module, required: false, as: 'boolean'

  # Includes all stack frames, including those the debug adapter might otherwise hide.
  property :includeAll, required: false, as: 'boolean'
end
