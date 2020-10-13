require_relative 'module'

# Response to ‘modules’ request.
class DAP::ModulesResponseBody < DAP::Base
  # All modules or range of modules.
  property :modules

  # The total number of modules available.
  property :totalModules, required: false, as: 'number'
end
