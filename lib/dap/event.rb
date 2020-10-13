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

# Base class of requests, responses, and events.
class DAP::Event < DAP::ProtocolMessage
  # (see ProtocolMessage#type)
  def self.type
    'event'
  end

  # Allowed event kinds and their body types.
  # @return [Hash<Symbol, Class>]
  def self.bodies
    @bodies ||= one_of(
      initialized: empty,
      stopped: DAP::StoppedEventBody,
      continued: DAP::ContinuedEventBody,
      exited: DAP::ExitedEventBody,
      terminated: DAP::TerminatedEventBody,
      thread: DAP::ThreadEventBody,
      output: DAP::OutputEventBody,
      breakpoint: DAP::BreakpointEventBody,
      module: DAP::ModuleEventBody,
      loadedSource: DAP::LoadedSourceEventBody,
      process: DAP::ProcessEventBody,
      capabilities: DAP::CapabilitiesEventBody,
      progressStart: DAP::ProgressStartEventBody,
      progressUpdate: DAP::ProgressUpdateEventBody,
      progressEnd: DAP::ProgressEndEventBody,
      invalidated: DAP::InvalidatedEventBody,
    )
  end

  # Type of event.
  property :event

  # Event-specific information.
  property :body, as: bodies.with(:event)
end
