require_relative 'exception_break_mode'
require_relative 'exception_details'

# Response to ‘exceptionInfo’ request.
class DAP::ExceptionInfoResponseBody < DAP::Base
  # ID of the exception that was thrown.
  property :exceptionId, as: 'string'

  # Descriptive text for the exception provided by the debug adapter.
  property :description, required: false, as: 'string'

  # Mode that caused the exception notification to be raised.
  property :breakMode, as: DAP::ExceptionBreakMode

  # Detailed information about the exception.
  property :details, required: false, as: DAP::ExceptionDetails
end
