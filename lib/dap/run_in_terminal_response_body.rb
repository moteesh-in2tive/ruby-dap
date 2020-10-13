# Response to ‘runInTerminal’ request.
class DAP::RunInTerminalResponseBody < DAP::Base
  # The process ID. The value should be less than or equal to 2147483647 (2^31 - 1).
  property :processId, required: false, as: 'number'

  # The process ID of the terminal shell. The value should be less than or equal to 2147483647 (2^31 - 1).
  property :shellProcessId, required: false, as: 'number'
end
