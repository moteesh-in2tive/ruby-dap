require_relative 'instruction_breakpoint'

class DAP::SetInstructionBreakpointsArguments < DAP::Base
  # The instruction references of the breakpoints
  property :breakpoints, as: many(DAP::InstructionBreakpoint)
end
