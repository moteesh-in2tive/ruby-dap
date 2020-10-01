require_relative 'checksum_algorithm'

class DAP::Checksum < DAP::Base
  # The algorithm used to calculate this checksum.
  property :algorithm, as: DAP::ChecksumAlgorithm

  # Value of the checksum.
  property :checksum
end
