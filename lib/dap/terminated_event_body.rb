class DAP::TerminatedEventBody < DAP::Base
  # A debug adapter may set 'restart' to true (or to an arbitrary object) to request that the front end restarts the session.
  # The value is not interpreted by the client and passed unmodified as an attribute '__restart' to the 'launch' and 'attach' requests.
  property :restart
end
