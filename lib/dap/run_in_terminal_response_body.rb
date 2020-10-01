class DAP::RunInTerminalResponseBody < DAP::Base
  # The process ID. The value should be less than or equal to 2147483647 (2^31 - 1).
  property :processId

  # The process ID of the terminal shell. The value should be less than or equal to 2147483647 (2^31 - 1).
  property :shellProcessId
end
