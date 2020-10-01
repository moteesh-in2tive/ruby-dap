require_relative 'thread'

class DAP::ThreadsResponseBody < DAP::Base
  # All threads.
  property :threads, as: many(DAP::Thread)
end
