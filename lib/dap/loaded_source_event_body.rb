require_relative 'source'

class DAP::LoadedSourceEventBody < DAP::Base
  # The reason for the event.
  # Values: 'new', 'changed', 'removed', etc.
  property :reason # 'new' | 'changed' | 'removed'

  # The new, changed, or removed source.
  property :source, as: DAP::Source
end
