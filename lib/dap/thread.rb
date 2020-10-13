# A Thread
class DAP::Thread < DAP::Base
  # Unique identifier for the thread.
  property :id, as: 'number'

  # A name of the thread.
  property :name, as: 'string'
end
