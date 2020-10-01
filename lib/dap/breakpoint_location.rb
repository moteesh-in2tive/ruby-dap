class DAP::BreakpointLocation < DAP::Base
  # Start line of breakpoint location.
  property :line

  # Optional start column of breakpoint location.
  property :column

  # Optional end line of breakpoint location if the location covers a range.
  property :endLine

  # Optional end column of breakpoint location if the location covers a range.
  property :endColumn
end
