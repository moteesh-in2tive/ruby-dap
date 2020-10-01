class DAP::ExceptionBreakMode < DAP::Enum
  NEVER = new('never')
  ALWAYS = new('always')
  UNHANDLED = new('unhandled')
  USERUNHANDLED = new('userUnhandled')
end
