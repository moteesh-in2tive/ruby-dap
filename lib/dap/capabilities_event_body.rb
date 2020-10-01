require_relative 'capabilities'

class DAP::CapabilitiesEventBody < DAP::Base
  # The set of updated capabilities.
  property :capabilities, as: DAP::Capabilities
end
