require_relative 'variable_presentation_hint'

class DAP::Variable < DAP::Base
  # The variable's name.
  property :name

  # The variable's value. This can be a multi-line text, e.g. for a function the body of a function.
  property :value

  # The type of the variable's value. Typically shown in the UI when hovering over the value.
  # This attribute should only be returned by a debug adapter if the client has passed the value true for the 'supportsVariableType' capability of the 'initialize' request.
  property :type

  # Properties of a variable that can be used to determine how to render the variable in the UI.
  property :presentationHint, as: DAP::VariablePresentationHint

  # Optional evaluatable name of this variable which can be passed to the 'EvaluateRequest' to fetch the variable's value.
  property :evaluateName

  # If variablesReference is > 0, the variable is structured and its children can be retrieved by passing variablesReference to the VariablesRequest.
  property :variablesReference

  # The number of named child variables.
  # The client can use this optional information to present the children in a paged UI and fetch them in chunks.
  property :namedVariables

  # The number of indexed child variables.
  # The client can use this optional information to present the children in a paged UI and fetch them in chunks.
  property :indexedVariables

  # Optional memory reference for the variable if the variable represents executable code, such as a function pointer.
  # This attribute is only required if the client has passed the value true for the 'supportsMemoryReferences' capability of the 'initialize' request.
  property :memoryReference
end
