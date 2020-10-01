require_relative 'function_breakpoint'

class DAP::SetFunctionBreakpointsArguments < DAP::Base
  # The function names of the breakpoints.
  property :breakpoints, as: many(DAP::FunctionBreakpoint)
end
