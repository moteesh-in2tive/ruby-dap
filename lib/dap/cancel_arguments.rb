class DAP::CancelArguments < DAP::Base
  # The ID (attribute 'seq') of the request to cancel. If missing no request is cancelled.
  # Both a 'requestId' and a 'progressId' can be specified in one request.
  property :requestId, required: false

  # The ID (attribute 'progressId') of the progress to cancel. If missing no progress is cancelled.
  # Both a 'requestId' and a 'progressId' can be specified in one request.
  property :progressId, required: false
end
