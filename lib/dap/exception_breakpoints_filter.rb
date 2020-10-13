# An ExceptionBreakpointsFilter is shown in the UI as an option for configuring
# how exceptions are dealt with.
class DAP::ExceptionBreakpointsFilter < DAP::Base
  # The internal ID of the filter. This value is passed to the setExceptionBreakpoints request.
  property :filter

  # The name of the filter. This will be shown in the UI.
  property :label

  # Initial value of the filter. If not specified a value 'false' is assumed.
  property :default, required: false
end
