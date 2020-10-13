# Arguments for ‘scopes’ request.
class DAP::ScopesArguments < DAP::Base
  # Retrieve the scopes for this stackframe.
  property :frameId, as: 'number'
end
