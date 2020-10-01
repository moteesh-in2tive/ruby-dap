class DAP::InvalidatedEventBody < DAP::Base
  # Optional set of logical areas that got invalidated. This property has a hint characteristic: a client can only be expected to make a 'best effort' in honouring the areas but there are no guarantees. If this property is missing, empty, or if values are not understand the client should assume a single value 'all'.
  property :areas, required: false # InvalidatedAreas[]

  # If specified, the client only needs to refetch data related to this thread.
  property :threadId, required: false

  # If specified, the client only needs to refetch data related to this stack frame (and the 'threadId' is ignored).
  property :stackFrameId, required: false
end
