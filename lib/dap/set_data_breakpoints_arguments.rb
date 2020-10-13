require_relative 'data_breakpoint'

# Arguments for ‘setDataBreakpoints’ request.
class DAP::SetDataBreakpointsArguments < DAP::Base
  # The contents of this array replaces all existing data breakpoints. An empty array clears all data breakpoints.
  property :breakpoints
end
