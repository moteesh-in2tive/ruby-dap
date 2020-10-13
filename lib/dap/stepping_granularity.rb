# The granularity of one ‘step’ in the stepping requests ‘next’, ‘stepIn’,
# ‘stepOut’, and ‘stepBack’.
class DAP::SteppingGranularity < DAP::Enum
  # The step should allow the program to run until the current statement has
  # finished executing. The meaning of a statement is determined by the adapter
  # and it may be considered equivalent to a line. For example ‘for(int i = 0; i
  # < 10; i++)’ could be considered to have 3 statements ‘int i = 0’, ‘i < 10’,
  # and ‘i++’
  STATEMENT = new('statement')
  # The step should allow the program to run until the current source line has
  # executed
  LINE = new('line')
  # The step should allow one instruction to execute (e.g. one x86 instruction)
  INSTRUCTION = new('instruction')
end
