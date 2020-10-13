# This enumeration defines all possible access types for data breakpoints.
class DAP::DataBreakpointAccessType < DAP::Enum
  READ = new('read')
  WRITE = new('write')
  READWRITE = new('readWrite')
end
