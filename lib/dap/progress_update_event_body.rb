# The event signals that the progress reporting needs to updated with a new
# message and/or percentage. The client does not have to update the UI
# immediately, but the clients needs to keep track of the message and/or
# percentage values. This event should only be sent if the client has passed the
# value true for the ‘supportsProgressReporting’ capability of the ‘initialize’
# request.
class DAP::ProgressUpdateEventBody < DAP::Base
  # The ID that was introduced in the initial 'progressStart' event.
  property :progressId, as: 'string'

  # Optional, more detailed progress message. If omitted, the previous message (if any) is used.
  property :message, required: false, as: 'string'

  # Optional progress percentage to display (value range: 0 to 100). If omitted no percentage will be shown.
  property :percentage, required: false, as: 'number'
end
