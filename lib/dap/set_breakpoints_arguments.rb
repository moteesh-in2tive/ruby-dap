require_relative 'source'
require_relative 'source_breakpoint'

class DAP::SetBreakpointsArguments < DAP::Base
  # The source location of the breakpoints; either 'source.path' or 'source.reference' must be specified.
  property :source, as: DAP::Source

  # The code locations of the breakpoints.
  property :breakpoints, required: false, as: many(DAP::SourceBreakpoint)

  # Deprecated: The code locations of the breakpoints.
  property :lines, required: false

  # A value of true indicates that the underlying source has been modified which results in new breakpoint locations.
  property :sourceModified, required: false
end
