class DAP::InitializeRequestArguments < DAP::Base
  # The ID of the (frontend) client using this adapter.
  property :clientID, required: false

  # The human readable name of the (frontend) client using this adapter.
  property :clientName, required: false

  # The ID of the debug adapter.
  property :adapterID

  # The ISO-639 locale of the (frontend) client using this adapter, e.g. en-US or de-CH.
  property :locale, required: false

  # If true all line numbers are 1-based (default).
  property :linesStartAt1, required: false

  # If true all column numbers are 1-based (default).
  property :columnsStartAt1, required: false

  # Determines in what format paths are specified. The default is 'path', which is the native format.
  # Values: 'path', 'uri', etc.
  property :pathFormat, required: false # 'path' | 'uri' | string

  # Client supports the optional type attribute for variables.
  property :supportsVariableType, required: false

  # Client supports the paging of variables.
  property :supportsVariablePaging, required: false

  # Client supports the runInTerminal request.
  property :supportsRunInTerminalRequest, required: false

  # Client supports memory references.
  property :supportsMemoryReferences, required: false

  # Client supports progress reporting.
  property :supportsProgressReporting, required: false

  # Client supports the invalidated event.
  property :supportsInvalidatedEvent, required: false
end
