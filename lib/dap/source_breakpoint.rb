# Properties of a breakpoint or logpoint passed to the setBreakpoints request.
class DAP::SourceBreakpoint < DAP::Base
  # The source line of the breakpoint or logpoint.
  property :line

  # An optional source column of the breakpoint.
  property :column, required: false

  # An optional expression for conditional breakpoints.
  # It is only honored by a debug adapter if the capability 'supportsConditionalBreakpoints' is true.
  property :condition, required: false

  # An optional expression that controls how many hits of the breakpoint are ignored.
  # The backend is expected to interpret the expression as needed.
  # The attribute is only honored by a debug adapter if the capability 'supportsHitConditionalBreakpoints' is true.
  property :hitCondition, required: false

  # If this attribute exists and is non-empty, the backend must not 'break' (stop)
  # but log the message instead. Expressions within {} are interpolated.
  # The attribute is only honored by a debug adapter if the capability 'supportsLogPoints' is true.
  property :logMessage, required: false
end
