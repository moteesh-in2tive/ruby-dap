require_relative 'instruction_breakpoint'

# Arguments for ‘setInstructionBreakpoints’ request
class DAP::SetInstructionBreakpointsArguments < DAP::Base
  # The instruction references of the breakpoints
  property :breakpoints
end
