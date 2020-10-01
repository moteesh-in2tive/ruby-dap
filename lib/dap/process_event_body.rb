class DAP::ProcessEventBody < DAP::Base
  # The logical name of the process. This is usually the full path to process's executable file. Example: /home/example/myproj/program.js.
  property :name

  # The system process id of the debugged process. This property will be missing for non-system processes.
  property :systemProcessId

  # If true, the process is running on the same computer as the debug adapter.
  property :isLocalProcess

  # Describes how the debug engine started debugging this process.
  # Values:
  # 'launch': Process was launched under the debugger.
  # 'attach': Debugger attached to an existing process.
  # 'attachForSuspendedLaunch': A project launcher component has launched a new process in a suspended state and then asked the debugger to attach.
  # etc.
  property :startMethod # 'launch' | 'attach' | 'attachForSuspendedLaunch'

  # The size of a pointer or address for this process, in bits. This value may be used by clients when formatting addresses for display.
  property :pointerSize
end
