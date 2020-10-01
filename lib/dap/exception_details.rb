require_relative 'exception_details'

class DAP::ExceptionDetails < DAP::Base
  # Message contained in the exception.
  property :message

  # Short type name of the exception object.
  property :typeName

  # Fully-qualified type name of the exception object.
  property :fullTypeName

  # Optional expression that can be evaluated in the current scope to obtain the exception object.
  property :evaluateName

  # Stack trace at the time the exception was thrown.
  property :stackTrace

  # Details of the exception contained by this exception, if any.
  property :innerException, as: many(DAP::ExceptionDetails)
end
