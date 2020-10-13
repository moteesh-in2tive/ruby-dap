require_relative 'checksum_algorithm'

# The checksum of an item calculated by the specified algorithm.
class DAP::Checksum < DAP::Base
  # The algorithm used to calculate this checksum.
  property :algorithm, as: DAP::ChecksumAlgorithm

  # Value of the checksum.
  property :checksum
end
