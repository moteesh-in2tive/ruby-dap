class DAP::FunctionBreakpoint < DAP::Base
  # The name of the function.
  property :name

  # An optional expression for conditional breakpoints.
  # It is only honored by a debug adapter if the capability 'supportsConditionalBreakpoints' is true.
  property :condition, required: false

  # An optional expression that controls how many hits of the breakpoint are ignored.
  # The backend is expected to interpret the expression as needed.
  # The attribute is only honored by a debug adapter if the capability 'supportsHitConditionalBreakpoints' is true.
  property :hitCondition, required: false
end
