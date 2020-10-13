require_relative 'variable'

# Response to ‘variables’ request.
class DAP::VariablesResponseBody < DAP::Base
  # All (or a range) of variables for the given variable reference.
  property :variables, as: many(DAP::Variable)
end
