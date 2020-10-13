require_relative 'data_breakpoint_access_type'

# Response to ‘dataBreakpointInfo’ request.
class DAP::DataBreakpointInfoResponseBody < DAP::Base
  # An identifier for the data on which a data breakpoint can be registered with the setDataBreakpoints request or null if no data breakpoint is available.
  property :dataId

  # UI string that describes on what data the breakpoint is set on or why a data breakpoint is not available.
  property :description, as: 'string'

  # Optional attribute listing the available access types for a potential data breakpoint. A UI frontend could surface this information.
  property :accessTypes, required: false

  # Optional attribute indicating that a potential data breakpoint could be persisted across sessions.
  property :canPersist, required: false, as: 'boolean'
end
