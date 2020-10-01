require_relative 'value_format'

class DAP::SetExpressionArguments < DAP::Base
  # The l-value expression to assign to.
  property :expression

  # The value expression to assign to the l-value expression.
  property :value

  # Evaluate the expressions in the scope of this stack frame. If not specified, the expressions are evaluated in the global scope.
  property :frameId

  # Specifies how the resulting value should be formatted.
  property :format, as: DAP::ValueFormat
end
