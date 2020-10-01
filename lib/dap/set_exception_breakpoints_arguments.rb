require_relative 'exception_options'

class DAP::SetExceptionBreakpointsArguments < DAP::Base
  # IDs of checked exception options. The set of IDs is returned via the 'exceptionBreakpointFilters' capability.
  property :filters

  # Configuration options for selected exceptions.
  # The attribute is only honored by a debug adapter if the capability 'supportsExceptionOptions' is true.
  property :exceptionOptions, required: false, as: many(DAP::ExceptionOptions)
end
