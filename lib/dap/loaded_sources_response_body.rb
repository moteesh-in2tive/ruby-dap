require_relative 'source'

class DAP::LoadedSourcesResponseBody < DAP::Base
  # Set of loaded sources.
  property :sources, as: many(DAP::Source)
end
