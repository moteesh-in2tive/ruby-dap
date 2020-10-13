require_relative 'exception_details'

# Detailed information about an exception that has occurred.
class DAP::ExceptionDetails < DAP::Base
  # Message contained in the exception.
  property :message, required: false, as: 'string'

  # Short type name of the exception object.
  property :typeName, required: false, as: 'string'

  # Fully-qualified type name of the exception object.
  property :fullTypeName, required: false, as: 'string'

  # Optional expression that can be evaluated in the current scope to obtain the exception object.
  property :evaluateName, required: false, as: 'string'

  # Stack trace at the time the exception was thrown.
  property :stackTrace, required: false, as: 'string'

  # Details of the exception contained by this exception, if any.
  property :innerException, required: false, as: many(DAP::ExceptionDetails)
end
