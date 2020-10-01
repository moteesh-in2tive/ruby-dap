class DAP::SetVariableResponseBody < DAP::Base
  # The new value of the variable.
  property :value

  # The type of the new value. Typically shown in the UI when hovering over the value.
  property :type, required: false

  # If variablesReference is > 0, the new value is structured and its children can be retrieved by passing variablesReference to the VariablesRequest.
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
