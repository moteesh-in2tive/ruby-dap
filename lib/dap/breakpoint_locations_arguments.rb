require_relative 'source'

# Arguments for ‘breakpointLocations’ request.
class DAP::BreakpointLocationsArguments < DAP::Base
  # The source location of the breakpoints; either 'source.path' or 'source.reference' must be specified.
  property :source, as: DAP::Source

  # Start line of range to search possible breakpoint locations in. If only the line is specified, the request returns all possible locations in that line.
  property :line, as: 'number'

  # Optional start column of range to search possible breakpoint locations in. If no start column is given, the first column in the start line is assumed.
  property :column, required: false, as: 'number'

  # Optional end line of range to search possible breakpoint locations in. If no end line is given, then the end line is assumed to be the start line.
  property :endLine, required: false, as: 'number'

  # Optional end column of range to search possible breakpoint locations in. If no end column is given, then it is assumed to be in the last column of the end line.
  property :endColumn, required: false, as: 'number'
end
