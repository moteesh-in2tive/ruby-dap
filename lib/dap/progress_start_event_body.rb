class DAP::ProgressStartEventBody < DAP::Base
  # An ID that must be used in subsequent 'progressUpdate' and 'progressEnd' events to make them refer to the same progress reporting.
  # IDs must be unique within a debug session.
  property :progressId

  # Mandatory (short) title of the progress reporting. Shown in the UI to describe the long running operation.
  property :title

  # The request ID that this progress report is related to. If specified a debug adapter is expected to emit
  # progress events for the long running request until the request has been either completed or cancelled.
  # If the request ID is omitted, the progress report is assumed to be related to some general activity of the debug adapter.
  property :requestId, required: false

  # If true, the request that reports progress may be canceled with a 'cancel' request.
  # So this property basically controls whether the client should use UX that supports cancellation.
  # Clients that don't support cancellation are allowed to ignore the setting.
  property :cancellable, required: false

  # Optional, more detailed progress message.
  property :message, required: false

  # Optional progress percentage to display (value range: 0 to 100). If omitted no percentage will be shown.
  property :percentage, required: false
end
