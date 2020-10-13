# Arguments for ‘completions’ request.
class DAP::CompletionsArguments < DAP::Base
  # Returns completions in the scope of this stack frame. If not specified, the completions are returned for the global scope.
  property :frameId, required: false, as: 'number'

  # One or more source lines. Typically this is the text a user has typed into the debug console before he asked for completion.
  property :text, as: 'string'

  # The character position for which to determine the completion proposals.
  property :column, as: 'number'

  # An optional line for which to determine the completion proposals. If missing the first line of the text is assumed.
  property :line, required: false, as: 'number'
end
