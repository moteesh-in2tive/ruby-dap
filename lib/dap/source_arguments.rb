require_relative 'source'

# Arguments for ‘source’ request.
class DAP::SourceArguments < DAP::Base
  # Specifies the source content to load. Either source.path or source.sourceReference must be specified.
  property :source, required: false, as: DAP::Source

  # The reference to the source. This is the same as source.sourceReference.
  # This is provided for backward compatibility since old backends do not understand the 'source' attribute.
  property :sourceReference, as: 'number'
end
