# Arguments for ‘runInTerminal’ request.
class DAP::RunInTerminalRequestArguments < DAP::Base
  # What kind of terminal to launch.
  # Values: 'integrated', 'external', etc.
  property :kind, required: false, as: 'string'

  # Optional title of the terminal.
  property :title, required: false, as: 'string'

  # Working directory of the command.
  property :cwd, as: 'string'

  # List of arguments. The first argument is the command to run.
  property :args, as: 'string[]'

  # Environment key-value pairs that are added to or removed from the default environment.
  property :env, required: false
end
