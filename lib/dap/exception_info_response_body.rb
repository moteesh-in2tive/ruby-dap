require_relative 'exception_break_mode'
require_relative 'exception_details'

class DAP::ExceptionInfoResponseBody < DAP::Base
  # ID of the exception that was thrown.
  property :exceptionId

  # Descriptive text for the exception provided by the debug adapter.
  property :description, required: false

  # Mode that caused the exception notification to be raised.
  property :breakMode, as: DAP::ExceptionBreakMode

  # Detailed information about the exception.
  property :details, required: false, as: DAP::ExceptionDetails
end
