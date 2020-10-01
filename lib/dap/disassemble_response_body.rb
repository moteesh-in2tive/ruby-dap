require_relative 'disassembled_instruction'

class DAP::DisassembleResponseBody < DAP::Base
  # The list of disassembled instructions.
  property :instructions, as: many(DAP::DisassembledInstruction)
end
