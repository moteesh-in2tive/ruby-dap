# Names of checksum algorithms that may be supported by a debug adapter.
class DAP::ChecksumAlgorithm < DAP::Enum
  MD5 = new('MD5')
  SHA1 = new('SHA1')
  SHA256 = new('SHA256')
  TIMESTAMP = new('timestamp')
end
