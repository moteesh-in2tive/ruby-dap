# Arguments for ‘dataBreakpointInfo’ request.
class DAP::DataBreakpointInfoArguments < DAP::Base
  # Reference to the Variable container if the data breakpoint is requested for a child of the container.
  property :variablesReference, required: false, as: 'number'

  # The name of the Variable's child to obtain data breakpoint information for.
  # If variableReference isn’t provided, this can be an expression.
  property :name, as: 'string'
end
