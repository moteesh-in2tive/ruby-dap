class DAP::ExceptionPathSegment < DAP::Base
  # If false or missing this segment matches the names provided, otherwise it matches anything except the names provided.
  property :negate, required: false

  # Depending on the value of 'negate' the names that should match or not match.
  property :names
end
