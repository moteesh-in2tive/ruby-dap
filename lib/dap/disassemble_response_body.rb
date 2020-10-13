require_relative 'disassembled_instruction'

# Response to ‘disassemble’ request.
class DAP::DisassembleResponseBody < DAP::Base
  # The list of disassembled instructions.
  property :instructions
end
