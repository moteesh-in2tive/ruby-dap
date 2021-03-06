# Properties of a breakpoint passed to the setInstructionBreakpoints request
class DAP::InstructionBreakpoint < DAP::Base
  # The instruction reference of the breakpoint.
  # This should be a memory or instruction pointer reference from an EvaluateResponse, Variable, StackFrame, GotoTarget, or Breakpoint.
  property :instructionReference, as: 'string'

  # An optional offset from the instruction reference.
  # This can be negative.
  property :offset, required: false, as: 'number'

  # An optional expression for conditional breakpoints.
  # It is only honored by a debug adapter if the capability 'supportsConditionalBreakpoints' is true.
  property :condition, required: false, as: 'string'

  # An optional expression that controls how many hits of the breakpoint are ignored.
  # The backend is expected to interpret the expression as needed.
  # The attribute is only honored by a debug adapter if the capability 'supportsHitConditionalBreakpoints' is true.
  property :hitCondition, required: false, as: 'string'
end
