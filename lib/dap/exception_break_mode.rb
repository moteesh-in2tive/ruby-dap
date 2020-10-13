# This enumeration defines all possible conditions when a thrown exception should
# result in a break.
class DAP::ExceptionBreakMode < DAP::Enum
  # never breaks
  NEVER = new('never')
  # always breaks
  ALWAYS = new('always')
  # breaks when exception unhandled
  UNHANDLED = new('unhandled')
  # breaks if the exception is not handled by user code
  USERUNHANDLED = new('userUnhandled')
end
