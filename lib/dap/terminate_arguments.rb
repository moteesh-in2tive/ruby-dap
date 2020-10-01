class DAP::TerminateArguments < DAP::Base
  # A value of true indicates that this 'terminate' request is part of a restart sequence.
  property :restart, required: false
end
