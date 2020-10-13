require_relative 'completion_item_type'

# CompletionItems are the suggestions returned from the CompletionsRequest.
class DAP::CompletionItem < DAP::Base
  # The label of this completion item. By default this is also the text that is inserted when selecting this completion.
  property :label, as: 'string'

  # If text is not falsy then it is inserted instead of the label.
  property :text, required: false, as: 'string'

  # A string that should be used when comparing this item with other items. When `falsy` the label is used.
  property :sortText, required: false, as: 'string'

  # The item's type. Typically the client uses this information to render the item in the UI with an icon.
  property :type, required: false, as: DAP::CompletionItemType

  # This value determines the location (in the CompletionsRequest's 'text' attribute) where the completion text is added.
  # If missing the text is added at the location specified by the CompletionsRequest's 'column' attribute.
  property :start, required: false, as: 'number'

  # This value determines how many characters are overwritten by the completion text.
  # If missing the value 0 is assumed which results in the completion text being inserted.
  property :length, required: false, as: 'number'

  # Determines the start of the new selection after the text has been inserted (or replaced).
  # The start position must in the range 0 and length of the completion text.
  # If omitted the selection starts at the end of the completion text.
  property :selectionStart, required: false, as: 'number'

  # Determines the length of the new selection after the text has been inserted (or replaced).
  # The selection can not extend beyond the bounds of the completion text.
  # If omitted the length is assumed to be 0.
  property :selectionLength, required: false, as: 'number'
end
