require_relative 'source'

# The event indicates that the target has produced some output.
class DAP::OutputEventBody < DAP::Base
  # The output category. If not specified, 'console' is assumed.
  # Values: 'console', 'stdout', 'stderr', 'telemetry', etc.
  property :category, required: false # 'console' | 'stdout' | 'stderr' | 'telemetry' | string

  # The output to report.
  property :output

  # Support for keeping an output log organized by grouping related messages.
  # Values:
  # 'start': Start a new group in expanded mode. Subsequent output events are members of the group and should be shown indented.
  # The 'output' attribute becomes the name of the group and is not indented.
  # 'startCollapsed': Start a new group in collapsed mode. Subsequent output events are members of the group and should be shown indented (as soon as the group is expanded).
  # The 'output' attribute becomes the name of the group and is not indented.
  # 'end': End the current group and decreases the indentation of subsequent output events.
  # A non empty 'output' attribute is shown as the unindented end of the group.
  # etc.
  property :group, required: false # 'start' | 'startCollapsed' | 'end'

  # If an attribute 'variablesReference' exists and its value is > 0, the output contains objects which can be retrieved by passing 'variablesReference' to the 'variables' request. The value should be less than or equal to 2147483647 (2^31 - 1).
  property :variablesReference, required: false

  # An optional source location where the output was produced.
  property :source, required: false, as: DAP::Source

  # An optional source location line where the output was produced.
  property :line, required: false

  # An optional source location column where the output was produced.
  property :column, required: false

  # Optional data to report. For the 'telemetry' category the data will be sent to telemetry, for the other categories the data is shown in JSON format.
  property :data, required: false
end
