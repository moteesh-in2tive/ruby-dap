require_relative 'exception_breakpoints_filter'
require_relative 'column_descriptor'
require_relative 'checksum_algorithm'

class DAP::Capabilities < DAP::Base
  # The debug adapter supports the 'configurationDone' request.
  property :supportsConfigurationDoneRequest, required: false

  # The debug adapter supports function breakpoints.
  property :supportsFunctionBreakpoints, required: false

  # The debug adapter supports conditional breakpoints.
  property :supportsConditionalBreakpoints, required: false

  # The debug adapter supports breakpoints that break execution after a specified number of hits.
  property :supportsHitConditionalBreakpoints, required: false

  # The debug adapter supports a (side effect free) evaluate request for data hovers.
  property :supportsEvaluateForHovers, required: false

  # Available filters or options for the setExceptionBreakpoints request.
  property :exceptionBreakpointFilters, required: false, as: many(DAP::ExceptionBreakpointsFilter)

  # The debug adapter supports stepping back via the 'stepBack' and 'reverseContinue' requests.
  property :supportsStepBack, required: false

  # The debug adapter supports setting a variable to a value.
  property :supportsSetVariable, required: false

  # The debug adapter supports restarting a frame.
  property :supportsRestartFrame, required: false

  # The debug adapter supports the 'gotoTargets' request.
  property :supportsGotoTargetsRequest, required: false

  # The debug adapter supports the 'stepInTargets' request.
  property :supportsStepInTargetsRequest, required: false

  # The debug adapter supports the 'completions' request.
  property :supportsCompletionsRequest, required: false

  # The set of characters that should trigger completion in a REPL. If not specified, the UI should assume the '.' character.
  property :completionTriggerCharacters, required: false

  # The debug adapter supports the 'modules' request.
  property :supportsModulesRequest, required: false

  # The set of additional module information exposed by the debug adapter.
  property :additionalModuleColumns, required: false, as: many(DAP::ColumnDescriptor)

  # Checksum algorithms supported by the debug adapter.
  property :supportedChecksumAlgorithms, required: false, as: many(DAP::ChecksumAlgorithm)

  # The debug adapter supports the 'restart' request. In this case a client should not implement 'restart' by terminating and relaunching the adapter but by calling the RestartRequest.
  property :supportsRestartRequest, required: false

  # The debug adapter supports 'exceptionOptions' on the setExceptionBreakpoints request.
  property :supportsExceptionOptions, required: false

  # The debug adapter supports a 'format' attribute on the stackTraceRequest, variablesRequest, and evaluateRequest.
  property :supportsValueFormattingOptions, required: false

  # The debug adapter supports the 'exceptionInfo' request.
  property :supportsExceptionInfoRequest, required: false

  # The debug adapter supports the 'terminateDebuggee' attribute on the 'disconnect' request.
  property :supportTerminateDebuggee, required: false

  # The debug adapter supports the delayed loading of parts of the stack, which requires that both the 'startFrame' and 'levels' arguments and the 'totalFrames' result of the 'StackTrace' request are supported.
  property :supportsDelayedStackTraceLoading, required: false

  # The debug adapter supports the 'loadedSources' request.
  property :supportsLoadedSourcesRequest, required: false

  # The debug adapter supports logpoints by interpreting the 'logMessage' attribute of the SourceBreakpoint.
  property :supportsLogPoints, required: false

  # The debug adapter supports the 'terminateThreads' request.
  property :supportsTerminateThreadsRequest, required: false

  # The debug adapter supports the 'setExpression' request.
  property :supportsSetExpression, required: false

  # The debug adapter supports the 'terminate' request.
  property :supportsTerminateRequest, required: false

  # The debug adapter supports data breakpoints.
  property :supportsDataBreakpoints, required: false

  # The debug adapter supports the 'readMemory' request.
  property :supportsReadMemoryRequest, required: false

  # The debug adapter supports the 'disassemble' request.
  property :supportsDisassembleRequest, required: false

  # The debug adapter supports the 'cancel' request.
  property :supportsCancelRequest, required: false

  # The debug adapter supports the 'breakpointLocations' request.
  property :supportsBreakpointLocationsRequest, required: false

  # The debug adapter supports the 'clipboard' context value in the 'evaluate' request.
  property :supportsClipboardContext, required: false

  # The debug adapter supports stepping granularities (argument 'granularity') for the stepping requests.
  property :supportsSteppingGranularity, required: false

  # The debug adapter supports adding breakpoints based on instruction references.
  property :supportsInstructionBreakpoints, required: false
end
