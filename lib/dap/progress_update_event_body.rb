class DAP::ProgressUpdateEventBody < DAP::Base
  # The ID that was introduced in the initial 'progressStart' event.
  property :progressId

  # Optional, more detailed progress message. If omitted, the previous message (if any) is used.
  property :message, required: false

  # Optional progress percentage to display (value range: 0 to 100). If omitted no percentage will be shown.
  property :percentage, required: false
end
