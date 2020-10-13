require_relative 'breakpoint'

# Response to ‘setDataBreakpoints’ request. Returned is information about each
# breakpoint created by this request.
class DAP::SetDataBreakpointsResponseBody < DAP::Base
  # Information about the data breakpoints. The array elements correspond to the elements of the input argument 'breakpoints' array.
  property :breakpoints, as: many(DAP::Breakpoint)
end
