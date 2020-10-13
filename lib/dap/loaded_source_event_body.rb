require_relative 'source'

# The event indicates that some source has been added, changed, or removed from
# the set of all loaded sources.
class DAP::LoadedSourceEventBody < DAP::Base
  # The reason for the event.
  # Values: 'new', 'changed', 'removed', etc.
  property :reason, as: 'string'

  # The new, changed, or removed source.
  property :source, as: DAP::Source
end
