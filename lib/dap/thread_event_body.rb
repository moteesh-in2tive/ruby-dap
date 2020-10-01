class DAP::ThreadEventBody < DAP::Base
  # The reason for the event.
  # Values: 'started', 'exited', etc.
  property :reason # 'started' | 'exited' | string

  # The identifier of the thread.
  property :threadId
end