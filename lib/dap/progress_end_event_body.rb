class DAP::ProgressEndEventBody < DAP::Base
  # The ID that was introduced in the initial 'ProgressStartEvent'.
  property :progressId

  # Optional, more detailed progress message. If omitted, the previous message (if any) is used.
  property :message
end
