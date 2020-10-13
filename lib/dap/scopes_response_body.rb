require_relative 'scope'

# Response to ‘scopes’ request.
class DAP::ScopesResponseBody < DAP::Base
  # The scopes of the stackframe. If the array has length zero, there are no scopes available.
  property :scopes, as: many(DAP::Scope)
end
