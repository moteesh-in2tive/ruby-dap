require_relative 'cancel_arguments'
require_relative 'run_in_terminal_request_arguments'
require_relative 'initialize_request_arguments'
require_relative 'launch_request_arguments'
require_relative 'attach_request_arguments'
require_relative 'disconnect_arguments'
require_relative 'terminate_arguments'
require_relative 'breakpoint_locations_arguments'
require_relative 'set_breakpoints_arguments'
require_relative 'set_function_breakpoints_arguments'
require_relative 'set_exception_breakpoints_arguments'
require_relative 'data_breakpoint_info_arguments'
require_relative 'set_data_breakpoints_arguments'
require_relative 'set_instruction_breakpoints_arguments'
require_relative 'continue_arguments'
require_relative 'next_arguments'
require_relative 'step_in_arguments'
require_relative 'step_out_arguments'
require_relative 'step_back_arguments'
require_relative 'reverse_continue_arguments'
require_relative 'restart_frame_arguments'
require_relative 'goto_arguments'
require_relative 'pause_arguments'
require_relative 'stack_trace_arguments'
require_relative 'scopes_arguments'
require_relative 'variables_arguments'
require_relative 'set_variable_arguments'
require_relative 'source_arguments'
require_relative 'terminate_threads_arguments'
require_relative 'modules_arguments'
require_relative 'evaluate_arguments'
require_relative 'set_expression_arguments'
require_relative 'step_in_targets_arguments'
require_relative 'goto_targets_arguments'
require_relative 'completions_arguments'
require_relative 'exception_info_arguments'
require_relative 'read_memory_arguments'
require_relative 'disassemble_arguments'

class DAP::Request < DAP::ProtocolMessage
  def self.type
    'request'
  end

  property :command

  property :arguments, as: one_of(
    cancel: DAP::CancelArguments,
    runInTerminal: DAP::RunInTerminalRequestArguments,
    initialize: DAP::InitializeRequestArguments,
    configurationDone: empty,
    launch: DAP::LaunchRequestArguments,
    attach: DAP::AttachRequestArguments,
    restart: empty,
    disconnect: DAP::DisconnectArguments,
    terminate: DAP::TerminateArguments,
    breakpointLocations: DAP::BreakpointLocationsArguments,
    setBreakpoints: DAP::SetBreakpointsArguments,
    setFunctionBreakpoints: DAP::SetFunctionBreakpointsArguments,
    setExceptionBreakpoints: DAP::SetExceptionBreakpointsArguments,
    dataBreakpointInfo: DAP::DataBreakpointInfoArguments,
    setDataBreakpoints: DAP::SetDataBreakpointsArguments,
    setInstructionBreakpoints: DAP::SetInstructionBreakpointsArguments,
    continue: DAP::ContinueArguments,
    next: DAP::NextArguments,
    stepIn: DAP::StepInArguments,
    stepOut: DAP::StepOutArguments,
    stepBack: DAP::StepBackArguments,
    reverseContinue: DAP::ReverseContinueArguments,
    restartFrame: DAP::RestartFrameArguments,
    goto: DAP::GotoArguments,
    pause: DAP::PauseArguments,
    stackTrace: DAP::StackTraceArguments,
    scopes: DAP::ScopesArguments,
    variables: DAP::VariablesArguments,
    setVariable: DAP::SetVariableArguments,
    source: DAP::SourceArguments,
    threads: empty,
    terminateThreads: DAP::TerminateThreadsArguments,
    modules: DAP::ModulesArguments,
    loadedSources: empty,
    evaluate: DAP::EvaluateArguments,
    setExpression: DAP::SetExpressionArguments,
    stepInTargets: DAP::StepInTargetsArguments,
    gotoTargets: DAP::GotoTargetsArguments,
    completions: DAP::CompletionsArguments,
    exceptionInfo: DAP::ExceptionInfoArguments,
    readMemory: DAP::ReadMemoryArguments,
    disassemble: DAP::DisassembleArguments,
  ).with(:command)
end
