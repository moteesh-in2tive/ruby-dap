class DAP::InitializeRequestArguments < DAP::Base
  # The ID of the (frontend) client using this adapter.
  property :clientID

  # The human readable name of the (frontend) client using this adapter.
  property :clientName

  # The ID of the debug adapter.
  property :adapterID

  # The ISO-639 locale of the (frontend) client using this adapter, e.g. en-US or de-CH.
  property :locale

  # If true all line numbers are 1-based (default).
  property :linesStartAt1

  # If true all column numbers are 1-based (default).
  property :columnsStartAt1

  # Determines in what format paths are specified. The default is 'path', which is the native format.
  # Values: 'path', 'uri', etc.
  property :pathFormat # 'path' | 'uri' | string

  # Client supports the optional type attribute for variables.
  property :supportsVariableType

  # Client supports the paging of variables.
  property :supportsVariablePaging

  # Client supports the runInTerminal request.
  property :supportsRunInTerminalRequest

  # Client supports memory references.
  property :supportsMemoryReferences

  # Client supports progress reporting.
  property :supportsProgressReporting

  # Client supports the invalidated event.
  property :supportsInvalidatedEvent
end
