require_relative 'breakpoint'

# Response to ‘setFunctionBreakpoints’ request. Returned is information about each
# breakpoint created by this request.
class DAP::SetFunctionBreakpointsResponseBody < DAP::Base
  # Information about the breakpoints. The array elements correspond to the elements of the 'breakpoints' array.
  property :breakpoints, as: many(DAP::Breakpoint)
end
