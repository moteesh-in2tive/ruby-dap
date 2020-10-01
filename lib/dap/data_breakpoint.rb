require_relative 'data_breakpoint_access_type'

class DAP::DataBreakpoint < DAP::Base
  # An id representing the data. This id is returned from the dataBreakpointInfo request.
  property :dataId

  # The access type of the data.
  property :accessType, required: false, as: DAP::DataBreakpointAccessType

  # An optional expression for conditional breakpoints.
  property :condition, required: false

  # An optional expression that controls how many hits of the breakpoint are ignored.
  # The backend is expected to interpret the expression as needed.
  property :hitCondition, required: false
end
