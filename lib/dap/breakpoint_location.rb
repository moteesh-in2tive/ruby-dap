# Properties of a breakpoint location returned from the ‘breakpointLocations’
# request.
class DAP::BreakpointLocation < DAP::Base
  # Start line of breakpoint location.
  property :line, as: 'number'

  # Optional start column of breakpoint location.
  property :column, required: false, as: 'number'

  # Optional end line of breakpoint location if the location covers a range.
  property :endLine, required: false, as: 'number'

  # Optional end column of breakpoint location if the location covers a range.
  property :endColumn, required: false, as: 'number'
end
