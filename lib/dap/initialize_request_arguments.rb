# Arguments for ‘initialize’ request.
class DAP::InitializeRequestArguments < DAP::Base
  # The ID of the (frontend) client using this adapter.
  property :clientID, required: false, as: 'string'

  # The human readable name of the (frontend) client using this adapter.
  property :clientName, required: false, as: 'string'

  # The ID of the debug adapter.
  property :adapterID, as: 'string'

  # The ISO-639 locale of the (frontend) client using this adapter, e.g. en-US or de-CH.
  property :locale, required: false, as: 'string'

  # If true all line numbers are 1-based (default).
  property :linesStartAt1, required: false, as: 'boolean'

  # If true all column numbers are 1-based (default).
  property :columnsStartAt1, required: false, as: 'boolean'

  # Determines in what format paths are specified. The default is 'path', which is the native format.
  # Values: 'path', 'uri', etc.
  property :pathFormat, required: false, as: 'string'

  # Client supports the optional type attribute for variables.
  property :supportsVariableType, required: false, as: 'boolean'

  # Client supports the paging of variables.
  property :supportsVariablePaging, required: false, as: 'boolean'

  # Client supports the runInTerminal request.
  property :supportsRunInTerminalRequest, required: false, as: 'boolean'

  # Client supports memory references.
  property :supportsMemoryReferences, required: false, as: 'boolean'

  # Client supports progress reporting.
  property :supportsProgressReporting, required: false, as: 'boolean'

  # Client supports the invalidated event.
  property :supportsInvalidatedEvent, required: false, as: 'boolean'
end
