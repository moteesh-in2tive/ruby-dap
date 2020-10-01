require_relative 'variable_presentation_hint'

class DAP::EvaluateResponseBody < DAP::Base
  # The result of the evaluate request.
  property :result

  # The optional type of the evaluate result.
  # This attribute should only be returned by a debug adapter if the client has passed the value true for the 'supportsVariableType' capability of the 'initialize' request.
  property :type, required: false

  # Properties of a evaluate result that can be used to determine how to render the result in the UI.
  property :presentationHint, required: false, as: DAP::VariablePresentationHint

  # If variablesReference is > 0, the evaluate result is structured and its children can be retrieved by passing variablesReference to the VariablesRequest.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :variablesReference

  # The number of named child variables.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :namedVariables, required: false

  # The number of indexed child variables.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :indexedVariables, required: false

  # Optional memory reference to a location appropriate for this result.
  # For pointer type eval results, this is generally a reference to the memory address contained in the pointer.
  # This attribute should be returned by a debug adapter if the client has passed the value true for the 'supportsMemoryReferences' capability of the 'initialize' request.
  property :memoryReference, required: false
end
