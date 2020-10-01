class DAP::RunInTerminalRequestArguments < DAP::Base
  # What kind of terminal to launch.
  # Values: 'integrated', 'external', etc.
  property :kind, required: false # 'integrated' | 'external'

  # Optional title of the terminal.
  property :title, required: false

  # Working directory of the command.
  property :cwd

  # List of arguments. The first argument is the command to run.
  property :args

  # Environment key-value pairs that are added to or removed from the default environment.
  property :env, required: false # { [key: string]: string | null; }
end