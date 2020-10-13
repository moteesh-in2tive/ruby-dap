# The event indicates that the execution of the debuggee has continued. Please
# note: a debug adapter is not expected to send this event in response to a
# request that implies that execution continues, e.g. ‘launch’ or ‘continue’. It
# is only necessary to send a ‘continued’ event if there was no previous request
# that implied this.
class DAP::ContinuedEventBody < DAP::Base
  # The thread which was continued.
  property :threadId

  # If 'allThreadsContinued' is true, a debug adapter can announce that all threads have continued.
  property :allThreadsContinued, required: false
end
