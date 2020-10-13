require_relative 'capabilities'
require_relative 'error_response_body'
require_relative 'run_in_terminal_response_body'
require_relative 'breakpoint_locations_response_body'
require_relative 'set_breakpoints_response_body'
require_relative 'set_function_breakpoints_response_body'
require_relative 'data_breakpoint_info_response_body'
require_relative 'set_data_breakpoints_response_body'
require_relative 'set_instruction_breakpoints_response_body'
require_relative 'continue_response_body'
require_relative 'stack_trace_response_body'
require_relative 'scopes_response_body'
require_relative 'variables_response_body'
require_relative 'set_variable_response_body'
require_relative 'source_response_body'
require_relative 'threads_response_body'
require_relative 'modules_response_body'
require_relative 'loaded_sources_response_body'
require_relative 'evaluate_response_body'
require_relative 'set_expression_response_body'
require_relative 'step_in_targets_response_body'
require_relative 'goto_targets_response_body'
require_relative 'completions_response_body'
require_relative 'exception_info_response_body'
require_relative 'read_memory_response_body'
require_relative 'disassemble_response_body'

# Response for a request.
class DAP::Response < DAP::ProtocolMessage
  # (see ProtocolMessage#type)
  def self.type
    'response'
  end

  # Allowed response commands and their body types.
  # @return [Hash<Symbol, Class>]
  def self.bodies
    @bodies ||= one_of(
      initialize: DAP::Capabilities,
      error: DAP::ErrorResponseBody,
      cancel: empty,
      runInTerminal: DAP::RunInTerminalResponseBody,
      configurationDone: empty,
      launch: empty,
      attach: empty,
      restart: empty,
      disconnect: empty,
      terminate: empty,
      breakpointLocations: DAP::BreakpointLocationsResponseBody,
      setBreakpoints: DAP::SetBreakpointsResponseBody,
      setFunctionBreakpoints: DAP::SetFunctionBreakpointsResponseBody,
      setExceptionBreakpoints: empty,
      dataBreakpointInfo: DAP::DataBreakpointInfoResponseBody,
      setDataBreakpoints: DAP::SetDataBreakpointsResponseBody,
      setInstructionBreakpoints: DAP::SetInstructionBreakpointsResponseBody,
      continue: DAP::ContinueResponseBody,
      next: empty,
      stepIn: empty,
      stepOut: empty,
      stepBack: empty,
      reverseContinue: empty,
      restartFrame: empty,
      goto: empty,
      pause: empty,
      stackTrace: DAP::StackTraceResponseBody,
      scopes: DAP::ScopesResponseBody,
      variables: DAP::VariablesResponseBody,
      setVariable: DAP::SetVariableResponseBody,
      source: DAP::SourceResponseBody,
      threads: DAP::ThreadsResponseBody,
      terminateThreads: empty,
      modules: DAP::ModulesResponseBody,
      loadedSources: DAP::LoadedSourcesResponseBody,
      evaluate: DAP::EvaluateResponseBody,
      setExpression: DAP::SetExpressionResponseBody,
      stepInTargets: DAP::StepInTargetsResponseBody,
      gotoTargets: DAP::GotoTargetsResponseBody,
      completions: DAP::CompletionsResponseBody,
      exceptionInfo: DAP::ExceptionInfoResponseBody,
      readMemory: DAP::ReadMemoryResponseBody,
      disassemble: DAP::DisassembleResponseBody,
    )
  end

  # (see Base#validate!)
  def validate!
    return unless success

    super
  end

  # Sequence number of the corresponding request.
  property :request_seq

  # Outcome of the request.
  # If true, the request was successful and the 'body' attribute may contain the result of the request.
  # If the value is false, the attribute 'message' contains the error in short form and the 'body' may contain additional information (see 'ErrorResponse.body.error').
  property :success

  # The command requested.
  property :command

  # Contains the raw error in short form if 'success' is false.
  # This raw error might be interpreted by the frontend and is not shown in the UI.
  # Some predefined values exist.
  property :message

  # Contains request result if success is true and optional error details if success is false.
  property :body, as: bodies.with(:command)
end
