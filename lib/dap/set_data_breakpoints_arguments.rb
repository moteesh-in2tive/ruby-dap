require_relative 'data_breakpoint'

class DAP::SetDataBreakpointsArguments < DAP::Base
  # The contents of this array replaces all existing data breakpoints. An empty array clears all data breakpoints.
  property :breakpoints, as: many(DAP::DataBreakpoint)
end
