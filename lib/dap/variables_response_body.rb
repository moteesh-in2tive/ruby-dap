require_relative 'variable'

class DAP::VariablesResponseBody < DAP::Base
  # All (or a range) of variables for the given variable reference.
  property :variables, as: many(DAP::Variable)
end
