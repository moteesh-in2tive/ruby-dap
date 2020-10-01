require_relative 'value_format'

class DAP::VariablesArguments < DAP::Base
  # The Variable reference.
  property :variablesReference

  # Optional filter to limit the child variables to either named or indexed. If omitted, both types are fetched.
  # Values: 'indexed', 'named', etc.
  property :filter # 'indexed' | 'named'

  # The index of the first variable to return; if omitted children start at 0.
  property :start

  # The number of variables to return. If count is missing or 0, all variables are returned.
  property :count

  # Specifies details on how to format the Variable values.
  # The attribute is only honored by a debug adapter if the capability 'supportsValueFormattingOptions' is true.
  property :format, as: DAP::ValueFormat
end
