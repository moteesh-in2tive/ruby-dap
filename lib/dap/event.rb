require_relative 'breakpoint_event_body'
require_relative 'capabilities_event_body'
require_relative 'continued_event_body'
require_relative 'exited_event_body'
require_relative 'invalidated_event_body'
require_relative 'loaded_source_event_body'
require_relative 'module_event_body'
require_relative 'output_event_body'
require_relative 'process_event_body'
require_relative 'progress_end_event_body'
require_relative 'progress_start_event_body'
require_relative 'progress_update_event_body'
require_relative 'stopped_event_body'
require_relative 'terminated_event_body'
require_relative 'thread_event_body'

class DAP::Event < DAP::ProtocolMessage
  def self.type
    'event'
  end

  property :event

  property :body, as: one_of(
    breakpoint: DAP::BreakpointEventBody,
    capabilities: DAP::CapabilitiesEventBody,
    continued: DAP::ContinuedEventBody,
    exited: DAP::ExitedEventBody,
    invalidated: DAP::InvalidatedEventBody,
    loadedSource: DAP::LoadedSourceEventBody,
    module: DAP::ModuleEventBody,
    output: DAP::OutputEventBody,
    process: DAP::ProcessEventBody,
    progressEnd: DAP::ProgressEndEventBody,
    progressStart: DAP::ProgressStartEventBody,
    progressUpdate: DAP::ProgressUpdateEventBody,
    stopped: DAP::StoppedEventBody,
    terminated: DAP::TerminatedEventBody,
    thread: DAP::ThreadEventBody,
  ).with(:event)
end
