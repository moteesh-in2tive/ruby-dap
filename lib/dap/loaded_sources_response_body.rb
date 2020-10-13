require_relative 'source'

# Response to ‘loadedSources’ request.
class DAP::LoadedSourcesResponseBody < DAP::Base
  # Set of loaded sources.
  property :sources
end
