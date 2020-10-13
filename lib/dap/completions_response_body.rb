require_relative 'completion_item'

# Response to ‘completions’ request.
class DAP::CompletionsResponseBody < DAP::Base
  # The possible completions for .
  property :targets, as: many(DAP::CompletionItem)
end
