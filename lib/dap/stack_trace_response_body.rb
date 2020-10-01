require_relative 'stack_frame'

class DAP::StackTraceResponseBody < DAP::Base
  # The frames of the stackframe. If the array has length zero, there are no stackframes available.
  # This means that there is no location information available.
  property :stackFrames, as: many(DAP::StackFrame)

  # The total number of frames available.
  property :totalFrames
end
