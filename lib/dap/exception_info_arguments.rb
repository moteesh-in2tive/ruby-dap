# Arguments for ‘exceptionInfo’ request.
class DAP::ExceptionInfoArguments < DAP::Base
  # Thread for which exception information should be retrieved.
  property :threadId, as: 'number'
end
