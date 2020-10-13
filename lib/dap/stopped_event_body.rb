# The event indicates that the execution of the debuggee has stopped due to some
# condition. This can be caused by a break point previously set, a stepping
# request has completed, by executing a debugger statement etc.
class DAP::StoppedEventBody < DAP::Base
  # The reason for the event.
  # For backward compatibility this string is shown in the UI if the 'description' attribute is missing (but it must not be translated).
  # Values: 'step', 'breakpoint', 'exception', 'pause', 'entry', 'goto', 'function breakpoint', 'data breakpoint', 'instruction breakpoint', etc.
  property :reason # 'step' | 'breakpoint' | 'exception' | 'pause' | 'entry' | 'goto' | 'function breakpoint' | 'data breakpoint' | 'instruction breakpoint' | string

  # The full reason for the event, e.g. 'Paused on exception'. This string is shown in the UI as is and must be translated.
  property :description, required: false

  # The thread which was stopped.
  property :threadId, required: false

  # A value of true hints to the frontend that this event should not change the focus.
  property :preserveFocusHint, required: false

  # Additional information. E.g. if reason is 'exception', text contains the exception name. This string is shown in the UI.
  property :text, required: false

  # If 'allThreadsStopped' is true, a debug adapter can announce that all threads have stopped.
  # - The client should use this information to enable that all threads can be expanded to access their stacktraces.
  # - If the attribute is missing or false, only the thread with the given threadId can be expanded.
  property :allThreadsStopped, required: false
end
