require_relative 'thread'

# Response to ‘threads’ request.
class DAP::ThreadsResponseBody < DAP::Base
  # All threads.
  property :threads, as: many(DAP::Thread)
end
