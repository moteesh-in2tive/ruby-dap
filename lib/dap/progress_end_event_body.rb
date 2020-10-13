# The event signals the end of the progress reporting with an optional final
# message. This event should only be sent if the client has passed the value true
# for the ‘supportsProgressReporting’ capability of the ‘initialize’ request.
class DAP::ProgressEndEventBody < DAP::Base
  # The ID that was introduced in the initial 'ProgressStartEvent'.
  property :progressId

  # Optional, more detailed progress message. If omitted, the previous message (if any) is used.
  property :message, required: false
end
