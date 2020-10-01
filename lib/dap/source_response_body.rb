class DAP::SourceResponseBody < DAP::Base
  # Content of the source reference.
  property :content

  # Optional content type (mime type) of the source.
  property :mimeType, required: false
end
