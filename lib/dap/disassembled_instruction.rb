require_relative 'source'

class DAP::DisassembledInstruction < DAP::Base
  # The address of the instruction. Treated as a hex value if prefixed with '0x', or as a decimal value otherwise.
  property :address

  # Optional raw bytes representing the instruction and its operands, in an implementation-defined format.
  property :instructionBytes

  # Text representing the instruction and its operands, in an implementation-defined format.
  property :instruction

  # Name of the symbol that corresponds with the location of this instruction, if any.
  property :symbol

  # Source location that corresponds to this instruction, if any.
  # Should always be set (if available) on the first instruction returned,
  # but can be omitted afterwards if this instruction maps to the same source file as the previous instruction.
  property :location, as: DAP::Source

  # The line within the source location that corresponds to this instruction, if any.
  property :line

  # The column within the line that corresponds to this instruction, if any.
  property :column

  # The end line of the range that corresponds to this instruction, if any.
  property :endLine

  # The end column of the range that corresponds to this instruction, if any.
  property :endColumn
end
