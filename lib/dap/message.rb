class DAP::Message < DAP::Base
  # Unique identifier for the message.
  property :id

  # A format string for the message. Embedded variables have the form '{name}'.
  # If variable name starts with an underscore character, the variable does not contain user data (PII) and can be safely used for telemetry purposes.
  property :format

  # An object used as a dictionary for looking up the variables in the format string.
  property :variables, required: false # { [key: string]: string; }

  # If true send to telemetry.
  property :sendTelemetry, required: false

  # If true show user.
  property :showUser, required: false

  # An optional url where additional information about this message can be found.
  property :url, required: false

  # An optional label that is presented to the user as the UI for opening the url.
  property :urlLabel, required: false
end
