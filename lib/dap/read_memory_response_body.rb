# Response to ‘readMemory’ request.
class DAP::ReadMemoryResponseBody < DAP::Base
  # The address of the first byte of data returned.
  # Treated as a hex value if prefixed with '0x', or as a decimal value otherwise.
  property :address, as: 'string'

  # The number of unreadable bytes encountered after the last successfully read byte.
  # This can be used to determine the number of bytes that must be skipped before a subsequent 'readMemory' request will succeed.
  property :unreadableBytes, required: false, as: 'number'

  # The bytes read from memory, encoded using base64.
  property :data, required: false, as: 'string'
end
