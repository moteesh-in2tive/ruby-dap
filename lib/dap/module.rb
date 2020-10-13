# A Module object represents a row in the modules view. Two attributes are
# mandatory: an id identifies a module in the modules view and is used in a
# ModuleEvent for identifying a module for adding, updating or deleting. The name
# is used to minimally render the module in the UI. Additional attributes can be
# added to the module. They will show up in the module View if they have a
# corresponding ColumnDescriptor. To avoid an unnecessary proliferation of
# additional attributes with similar semantics but different names we recommend to
# re-use attributes from the ‘recommended’ list below first, and only introduce
# new attributes if nothing appropriate could be found.
class DAP::Module < DAP::Base
  # Unique identifier for the module.
  property :id

  # A name of the module.
  property :name, as: 'string'

  # True if the module is optimized.
  property :isOptimized, required: false, as: 'boolean'

  # True if the module is considered 'user code' by a debugger that supports 'Just My Code'.
  property :isUserCode, required: false, as: 'boolean'

  # Version of Module.
  property :version, required: false, as: 'string'

  # User understandable description of if symbols were found for the module (ex: 'Symbols Loaded', 'Symbols not found', etc.
  property :symbolStatus, required: false, as: 'string'

  # Logical full path to the symbol file. The exact definition is implementation defined.
  property :symbolFilePath, required: false, as: 'string'

  # Module created or modified.
  property :dateTimeStamp, required: false, as: 'string'

  # Address range covered by this module.
  property :addressRange, required: false, as: 'string'
end
