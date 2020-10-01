require_relative 'exception_breakpoints_filter'
require_relative 'column_descriptor'
require_relative 'checksum_algorithm'

class DAP::Capabilities < DAP::Base
  # The debug adapter supports the 'configurationDone' request.
  property :supportsConfigurationDoneRequest

  # The debug adapter supports function breakpoints.
  property :supportsFunctionBreakpoints

  # The debug adapter supports conditional breakpoints.
  property :supportsConditionalBreakpoints

  # The debug adapter supports breakpoints that break execution after a specified number of hits.
  property :supportsHitConditionalBreakpoints

  # The debug adapter supports a (side effect free) evaluate request for data hovers.
  property :supportsEvaluateForHovers

  # Available filters or options for the setExceptionBreakpoints request.
  property :exceptionBreakpointFilters, as: many(DAP::ExceptionBreakpointsFilter)

  # The debug adapter supports stepping back via the 'stepBack' and 'reverseContinue' requests.
  property :supportsStepBack

  # The debug adapter supports setting a variable to a value.
  property :supportsSetVariable

  # The debug adapter supports restarting a frame.
  property :supportsRestartFrame

  # The debug adapter supports the 'gotoTargets' request.
  property :supportsGotoTargetsRequest

  # The debug adapter supports the 'stepInTargets' request.
  property :supportsStepInTargetsRequest

  # The debug adapter supports the 'completions' request.
  property :supportsCompletionsRequest

  # The set of characters that should trigger completion in a REPL. If not specified, the UI should assume the '.' character.
  property :completionTriggerCharacters

  # The debug adapter supports the 'modules' request.
  property :supportsModulesRequest

  # The set of additional module information exposed by the debug adapter.
  property :additionalModuleColumns, as: many(DAP::ColumnDescriptor)

  # Checksum algorithms supported by the debug adapter.
  property :supportedChecksumAlgorithms, as: many(DAP::ChecksumAlgorithm)

  # The debug adapter supports the 'restart' request. In this case a client should not implement 'restart' by terminating and relaunching the adapter but by calling the RestartRequest.
  property :supportsRestartRequest

  # The debug adapter supports 'exceptionOptions' on the setExceptionBreakpoints request.
  property :supportsExceptionOptions

  # The debug adapter supports a 'format' attribute on the stackTraceRequest, variablesRequest, and evaluateRequest.
  property :supportsValueFormattingOptions

  # The debug adapter supports the 'exceptionInfo' request.
  property :supportsExceptionInfoRequest

  # The debug adapter supports the 'terminateDebuggee' attribute on the 'disconnect' request.
  property :supportTerminateDebuggee

  # The debug adapter supports the delayed loading of parts of the stack, which requires that both the 'startFrame' and 'levels' arguments and the 'totalFrames' result of the 'StackTrace' request are supported.
  property :supportsDelayedStackTraceLoading

  # The debug adapter supports the 'loadedSources' request.
  property :supportsLoadedSourcesRequest

  # The debug adapter supports logpoints by interpreting the 'logMessage' attribute of the SourceBreakpoint.
  property :supportsLogPoints

  # The debug adapter supports the 'terminateThreads' request.
  property :supportsTerminateThreadsRequest

  # The debug adapter supports the 'setExpression' request.
  property :supportsSetExpression

  # The debug adapter supports the 'terminate' request.
  property :supportsTerminateRequest

  # The debug adapter supports data breakpoints.
  property :supportsDataBreakpoints

  # The debug adapter supports the 'readMemory' request.
  property :supportsReadMemoryRequest

  # The debug adapter supports the 'disassemble' request.
  property :supportsDisassembleRequest

  # The debug adapter supports the 'cancel' request.
  property :supportsCancelRequest

  # The debug adapter supports the 'breakpointLocations' request.
  property :supportsBreakpointLocationsRequest

  # The debug adapter supports the 'clipboard' context value in the 'evaluate' request.
  property :supportsClipboardContext

  # The debug adapter supports stepping granularities (argument 'granularity') for the stepping requests.
  property :supportsSteppingGranularity

  # The debug adapter supports adding breakpoints based on instruction references.
  property :supportsInstructionBreakpoints
end
