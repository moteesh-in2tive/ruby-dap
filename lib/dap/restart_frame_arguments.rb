# Arguments for ‘restartFrame’ request.
class DAP::RestartFrameArguments < DAP::Base
  # Restart this stackframe.
  property :frameId, as: 'number'
end
