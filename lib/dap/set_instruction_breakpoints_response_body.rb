require_relative 'breakpoint'

class DAP::SetInstructionBreakpointsResponseBody < DAP::Base
  # Information about the breakpoints. The array elements correspond to the elements of the 'breakpoints' array.
  property :breakpoints, as: many(DAP::Breakpoint)
end
