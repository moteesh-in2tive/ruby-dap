require_relative 'source'
require_relative 'checksum'

# A Source is a descriptor for source code. It is returned from the debug adapter
# as part of a StackFrame and it is used by clients when specifying breakpoints.
class DAP::Source < DAP::Base
  # The short name of the source. Every source returned from the debug adapter has a name.
  # When sending a source to the debug adapter this name is optional.
  property :name, required: false, as: 'string'

  # The path of the source to be shown in the UI.
  # It is only used to locate and load the content of the source if no sourceReference is specified (or its value is 0).
  property :path, required: false, as: 'string'

  # If sourceReference > 0 the contents of the source must be retrieved through the SourceRequest (even if a path is specified).
  # A sourceReference is only valid for a session, so it must not be used to persist a source.
  # The value should be less than or equal to 2147483647 (2^31 - 1).
  property :sourceReference, required: false, as: 'number'

  # An optional hint for how to present the source in the UI.
  # A value of 'deemphasize' can be used to indicate that the source is not available or that it is skipped on stepping.
  # Values: 'normal', 'emphasize', 'deemphasize', etc.
  property :presentationHint, required: false, as: 'string'

  # The (optional) origin of this source: possible values 'internal module', 'inlined content from source map', etc.
  property :origin, required: false, as: 'string'

  # An optional list of sources that are related to this source. These may be the source that generated this source.
  property :sources, required: false

  # Optional data that a debug adapter might want to loop through the client.
  # The client should leave the data intact and persist it across sessions. The client should not interpret the data.
  property :adapterData, required: false

  # The checksums associated with this file.
  property :checksums, required: false
end
