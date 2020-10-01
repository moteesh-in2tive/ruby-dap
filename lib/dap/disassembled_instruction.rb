require_relative 'source'

class DAP::DisassembledInstruction < DAP::Base
  # The address of the instruction. Treated as a hex value if prefixed with '0x', or as a decimal value otherwise.
  property :address

  # Optional raw bytes representing the instruction and its operands, in an implementation-defined format.
  property :instructionBytes, required: false

  # Text representing the instruction and its operands, in an implementation-defined format.
  property :instruction

  # Name of the symbol that corresponds with the location of this instruction, if any.
  property :symbol, required: false

  # Source location that corresponds to this instruction, if any.
  # Should always be set (if available) on the first instruction returned,
  # but can be omitted afterwards if this instruction maps to the same source file as the previous instruction.
  property :location, required: false, as: DAP::Source

  # The line within the source location that corresponds to this instruction, if any.
  property :line, required: false

  # The column within the line that corresponds to this instruction, if any.
  property :column, required: false

  # The end line of the range that corresponds to this instruction, if any.
  property :endLine, required: false

  # The end column of the range that corresponds to this instruction, if any.
  property :endColumn, required: false
end
