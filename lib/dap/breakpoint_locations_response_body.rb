require_relative 'breakpoint_location'

# Response to ‘breakpointLocations’ request. Contains possible locations for
# source breakpoints.
class DAP::BreakpointLocationsResponseBody < DAP::Base
  # Sorted set of possible breakpoint locations.
  property :breakpoints
end
