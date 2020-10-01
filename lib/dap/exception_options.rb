require_relative 'exception_path_segment'
require_relative 'exception_break_mode'

class DAP::ExceptionOptions < DAP::Base
  # A path that selects a single or multiple exceptions in a tree. If 'path' is missing, the whole tree is selected.
  # By convention the first segment of the path is a category that is used to group exceptions in the UI.
  property :path, as: many(DAP::ExceptionPathSegment)

  # Condition when a thrown exception should result in a break.
  property :breakMode, as: DAP::ExceptionBreakMode
end
