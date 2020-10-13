# Response to ‘source’ request.
class DAP::SourceResponseBody < DAP::Base
  # Content of the source reference.
  property :content, as: 'string'

  # Optional content type (mime type) of the source.
  property :mimeType, required: false, as: 'string'
end
