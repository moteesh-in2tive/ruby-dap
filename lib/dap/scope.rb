require_relative 'source'

class DAP::Scope < DAP::Base
  # Name of the scope such as 'Arguments', 'Locals', or 'Registers'. This string is shown in the UI as is and can be translated.
  property :name

  # An optional hint for how to present this scope in the UI. If this attribute is missing, the scope is shown with a generic UI.
  # Values:
  # 'arguments': Scope contains method arguments.
  # 'locals': Scope contains local variables.
  # 'registers': Scope contains registers. Only a single 'registers' scope should be returned from a 'scopes' request.
  # etc.
  property :presentationHint, required: false # 'arguments' | 'locals' | 'registers' | string

  # The variables of this scope can be retrieved by passing the value of variablesReference to the VariablesRequest.
  property :variablesReference

  # The number of named variables in this scope.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  property :namedVariables, required: false

  # The number of indexed variables in this scope.
  # The client can use this optional information to present the variables in a paged UI and fetch them in chunks.
  property :indexedVariables, required: false

  # If true, the number of variables in this scope is large or expensive to retrieve.
  property :expensive

  # Optional source for this scope.
  property :source, required: false, as: DAP::Source

  # Optional start line of the range covered by this scope.
  property :line, required: false

  # Optional start column of the range covered by this scope.
  property :column, required: false

  # Optional end line of the range covered by this scope.
  property :endLine, required: false

  # Optional end column of the range covered by this scope.
  property :endColumn, required: false
end
