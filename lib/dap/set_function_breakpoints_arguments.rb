require_relative 'function_breakpoint'

# Arguments for ‘setFunctionBreakpoints’ request.
class DAP::SetFunctionBreakpointsArguments < DAP::Base
  # The function names of the breakpoints.
  property :breakpoints, as: many(DAP::FunctionBreakpoint)
end
