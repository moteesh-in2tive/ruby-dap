require_relative 'stack_frame_format'

class DAP::StackTraceArguments < DAP::Base
  # Retrieve the stacktrace for this thread.
  property :threadId

  # The index of the first frame to return; if omitted frames start at 0.
  property :startFrame, required: false

  # The maximum number of frames to return. If levels is not specified or 0, all frames are returned.
  property :levels, required: false

  # Specifies details on how to format the stack frames.
  # The attribute is only honored by a debug adapter if the capability 'supportsValueFormattingOptions' is true.
  property :format, required: false, as: DAP::StackFrameFormat
end
