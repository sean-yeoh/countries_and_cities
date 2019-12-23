class FileUpload < ApplicationRecord
  include AttachmentUploader::Attachment(:attachment)
  enum status: { pending: 0, uploading: 1, uploaded: 2 }
end
