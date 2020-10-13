# Arguments for ‘disassemble’ request.
class DAP::DisassembleArguments < DAP::Base
  # Memory reference to the base location containing the instructions to disassemble.
  property :memoryReference, as: 'string'

  # Optional offset (in bytes) to be applied to the reference location before disassembling. Can be negative.
  property :offset, required: false, as: 'number'

  # Optional offset (in instructions) to be applied after the byte offset (if any) before disassembling. Can be negative.
  property :instructionOffset, required: false, as: 'number'

  # Number of instructions to disassemble starting at the specified location and offset.
  # An adapter must return exactly this number of instructions - any unavailable instructions should be replaced with an implementation-defined 'invalid instruction' value.
  property :instructionCount, as: 'number'

  # If true, the adapter should attempt to resolve memory addresses and other values to symbolic names.
  property :resolveSymbols, required: false, as: 'boolean'
end
