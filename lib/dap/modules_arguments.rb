class DAP::ModulesArguments < DAP::Base
  # The index of the first module to return; if omitted modules start at 0.
  property :startModule

  # The number of modules to return. If moduleCount is not specified or 0, all modules are returned.
  property :moduleCount
end
