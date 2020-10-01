class DAP::StoppedEventBody < DAP::Base
  # The reason for the event.
  # For backward compatibility this string is shown in the UI if the 'description' attribute is missing (but it must not be translated).
  # Values: 'step', 'breakpoint', 'exception', 'pause', 'entry', 'goto', 'function breakpoint', 'data breakpoint', 'instruction breakpoint', etc.
  property :reason # 'step' | 'breakpoint' | 'exception' | 'pause' | 'entry' | 'goto' | 'function breakpoint' | 'data breakpoint' | 'instruction breakpoint' | string

  # The full reason for the event, e.g. 'Paused on exception'. This string is shown in the UI as is and must be translated.
  property :description

  # The thread which was stopped.
  property :threadId

  # A value of true hints to the frontend that this event should not change the focus.
  property :preserveFocusHint

  # Additional information. E.g. if reason is 'exception', text contains the exception name. This string is shown in the UI.
  property :text

  # If 'allThreadsStopped' is true, a debug adapter can announce that all threads have stopped.
  # - The client should use this information to enable that all threads can be expanded to access their stacktraces.
  # - If the attribute is missing or false, only the thread with the given threadId can be expanded.
  property :allThreadsStopped
end
