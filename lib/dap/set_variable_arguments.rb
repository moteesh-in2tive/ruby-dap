require_relative 'value_format'

# Arguments for ‘setVariable’ request.
class DAP::SetVariableArguments < DAP::Base
  # The reference of the variable container.
  property :variablesReference

  # The name of the variable in the container.
  property :name

  # The value of the variable.
  property :value

  # Specifies details on how to format the response value.
  property :format, required: false, as: DAP::ValueFormat
end
