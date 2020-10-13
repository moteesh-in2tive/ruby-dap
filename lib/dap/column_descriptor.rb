# A ColumnDescriptor specifies what module attribute to show in a column of the
# ModulesView, how to format it, and what the column’s label should be. It is only
# used if the underlying UI actually supports this level of customization.
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
