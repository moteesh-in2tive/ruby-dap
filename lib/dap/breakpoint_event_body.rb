require_relative 'breakpoint'

# The event indicates that some information about a breakpoint has changed.
class DAP::BreakpointEventBody < DAP::Base
  # The reason for the event.
  # Values: 'changed', 'new', 'removed', etc.
  property :reason # 'changed' | 'new' | 'removed' | string

  # The 'id' attribute is used to find the target breakpoint and the other attributes are used as the new values.
  property :breakpoint, as: DAP::Breakpoint
end
