require 'json'

# The Debug Adapter Protocol
module DAP
  # (see DAP::Encoding.decode)
  def self.decode(s)
    DAP::Encoding.decode(s)
  end

  # (see DAP::Encoding.encode)
  def self.encode(message)
    DAP::Encoding.encode(message)
  end

  # (see DAP::Encoding.decode_all)
  def self.decode_all(s, &block)
    DAP::Encoding.decode_all(s, &block)
  end
end

require_relative 'dap/encoding'
require_relative 'dap/base'
require_relative 'dap/enum'
require_relative 'dap/relation'
require_relative 'dap/protocol_message'
