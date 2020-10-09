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

class DAP::Response < DAP::ProtocolMessage
  def self.type
    'response'
  end

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

  def validate!
    return unless success

    super
  end

  property :request_seq, :success, :command, :message
  property :body, as: bodies.with(:command)
end
