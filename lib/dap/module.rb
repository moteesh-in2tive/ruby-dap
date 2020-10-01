class DAP::Module < DAP::Base
  # Unique identifier for the module.
  property :id

  # A name of the module.
  property :name

  # True if the module is optimized.
  property :isOptimized, required: false

  # True if the module is considered 'user code' by a debugger that supports 'Just My Code'.
  property :isUserCode, required: false

  # Version of Module.
  property :version, required: false

  # User understandable description of if symbols were found for the module (ex: 'Symbols Loaded', 'Symbols not found', etc.
  property :symbolStatus, required: false

  # Logical full path to the symbol file. The exact definition is implementation defined.
  property :symbolFilePath, required: false

  # Module created or modified.
  property :dateTimeStamp, required: false

  # Address range covered by this module.
  property :addressRange, required: false
end
