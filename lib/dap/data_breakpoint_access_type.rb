class DAP::DataBreakpointAccessType < DAP::Enum
  READ = new('read')
  WRITE = new('write')
  READWRITE = new('readWrite')
end
