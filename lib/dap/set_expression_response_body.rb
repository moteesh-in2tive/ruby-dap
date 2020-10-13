require_relative 'variable_presentation_hint'

# Response to ‘setExpression’ request.
class DAP::SetExpressionResponseBody < DAP::Base
  # The new value of the expression.
  property :value

  # The optional type of the value.
  # This attribute should only be returned by a debug adapter if the client has passed the value true for the 'supportsVariableType' capability of the 'initialize' request.
  property :type, required: false

  # Properties of a value that can be used to determine how to render the result in the UI.
  property :presentationHint, required: false, as: DAP::VariablePresentationHint

  # If variablesReference is > 0, the value is structured and its children can be retrieved by passing variablesReference to the VariablesRequest.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :variablesReference, required: false

  # The number of named child variables.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :namedVariables, required: false

  # The number of indexed child variables.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :indexedVariables, required: false
end
