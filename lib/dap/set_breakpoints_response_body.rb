require_relative 'breakpoint'

class DAP::SetBreakpointsResponseBody < DAP::Base
  # Information about the breakpoints.
  # The array elements are in the same order as the elements of the 'breakpoints' (or the deprecated 'lines') array in the arguments.
  property :breakpoints, as: many(DAP::Breakpoint)
end
