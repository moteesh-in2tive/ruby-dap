require_relative 'variable_presentation_hint'

# A Variable is a name/value pair. Optionally a variable can have a ‘type’ that is
# shown if space permits or when hovering over the variable’s name. An optional
# ‘kind’ is used to render additional properties of the variable, e.g. different
# icons can be used to indicate that a variable is public or private. If the value
# is structured (has children), a handle is provided to retrieve the children with
# the VariablesRequest. If the number of named or indexed children is large, the
# numbers should be returned via the optional ‘namedVariables’ and
# ‘indexedVariables’ attributes. The client can use this optional information to
# present the children in a paged UI and fetch them in chunks.
class DAP::Variable < DAP::Base
  # The variable's name.
  property :name, as: 'string'

  # The variable's value. This can be a multi-line text, e.g. for a function the body of a function.
  property :value, as: 'string'

  # The type of the variable's value. Typically shown in the UI when hovering over the value.
  # This attribute should only be returned by a debug adapter if the client has passed the value true for the 'supportsVariableType' capability of the 'initialize' request.
  property :type, required: false, as: 'string'

  # Properties of a variable that can be used to determine how to render the variable in the UI.
  property :presentationHint, required: false, as: DAP::VariablePresentationHint

  # Optional evaluatable name of this variable which can be passed to the 'EvaluateRequest' to fetch the variable's value.
  property :evaluateName, required: false, as: 'string'

  # If variablesReference is > 0, the variable is structured and its children can be retrieved by passing variablesReference to the VariablesRequest.
  property :variablesReference, as: 'number'

  # The number of named child variables.
  # The client can use this optional information to present the children in a paged UI and fetch them in chunks.
  property :namedVariables, required: false, as: 'number'

  # The number of indexed child variables.
  # The client can use this optional information to present the children in a paged UI and fetch them in chunks.
  property :indexedVariables, required: false, as: 'number'

  # Optional memory reference for the variable if the variable represents executable code, such as a function pointer.
  # This attribute is only required if the client has passed the value true for the 'supportsMemoryReferences' capability of the 'initialize' request.
  property :memoryReference, required: false, as: 'string'
end
