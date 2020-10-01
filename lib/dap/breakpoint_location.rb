class DAP::BreakpointLocation < DAP::Base
  # Start line of breakpoint location.
  property :line

  # Optional start column of breakpoint location.
  property :column, required: false

  # Optional end line of breakpoint location if the location covers a range.
  property :endLine, required: false

  # Optional end column of breakpoint location if the location covers a range.
  property :endColumn, required: false
end
