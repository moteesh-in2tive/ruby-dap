require_relative 'breakpoint_location'

class DAP::BreakpointLocationsResponseBody < DAP::Base
  # Sorted set of possible breakpoint locations.
  property :breakpoints, as: many(DAP::BreakpointLocation)
end
