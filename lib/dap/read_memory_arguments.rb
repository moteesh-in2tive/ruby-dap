class DAP::ReadMemoryArguments < DAP::Base
  # Memory reference to the base location from which data should be read.
  property :memoryReference

  # Optional offset (in bytes) to be applied to the reference location before reading data. Can be negative.
  property :offset, required: false

  # Number of bytes to read at the specified location and offset.
  property :count
end
