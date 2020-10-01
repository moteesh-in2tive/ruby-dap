class DAP::ColumnDescriptor < DAP::Base
  # Name of the attribute rendered in this column.
  property :attributeName

  # Header UI label of column.
  property :label

  # Format to use for the rendered values in this column. TBD how the format strings looks like.
  property :format, required: false

  # Datatype of values in this column.  Defaults to 'string' if not specified.
  # Values: 'string', 'number', 'boolean', 'unixTimestampUTC', etc.
  property :type, required: false # 'string' | 'number' | 'boolean' | 'unixTimestampUTC'

  # Width of this column in characters (hint only).
  property :width, required: false
end
