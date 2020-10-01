require_relative 'module'

class DAP::ModulesResponseBody < DAP::Base
  # All modules or range of modules.
  property :modules, as: many(DAP::Module)

  # The total number of modules available.
  property :totalModules, required: false
end
