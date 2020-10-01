require_relative 'module'

class DAP::ModuleEventBody < DAP::Base
  # The reason for the event.
  # Values: 'new', 'changed', 'removed', etc.
  property :reason # 'new' | 'changed' | 'removed'

  # The new, changed, or removed module. In case of 'removed' only the module id is used.
  property :module, as: DAP::Module
end
