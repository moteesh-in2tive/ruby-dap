require_relative 'value_format'

# Arguments for ‘evaluate’ request.
class DAP::EvaluateArguments < DAP::Base
  # The expression to evaluate.
  property :expression, as: 'string'

  # Evaluate the expression in the scope of this stack frame. If not specified, the expression is evaluated in the global scope.
  property :frameId, required: false, as: 'number'

  # The context in which the evaluate request is run.
  # Values:
  # 'watch': evaluate is run in a watch.
  # 'repl': evaluate is run from REPL console.
  # 'hover': evaluate is run from a data hover.
  # 'clipboard': evaluate is run to generate the value that will be stored in the clipboard.
  # The attribute is only honored by a debug adapter if the capability 'supportsClipboardContext' is true.
  # etc.
  property :context, required: false, as: 'string'

  # Specifies details on how to format the Evaluate result.
  # The attribute is only honored by a debug adapter if the capability 'supportsValueFormattingOptions' is true.
  property :format, required: false, as: DAP::ValueFormat
end
