# frozen_string_literal: true

module Admin
  class FileUploadsController < Admin::BaseController
    def index
      @file_uploads = FileUpload.all.order(created_at: :desc)
    end

    def new
      @file_upload = FileUpload.new
    end

    def create
      @file_upload_service = ::FileUploadService.new(file_upload_params)
      if @file_upload_service.valid?
        @file_upload_service.save!
        redirect_to [:admin, :file_uploads], notice: 'File successfully uploaded.'
      else
        redirect_to [:new, :admin, :file_upload], alert: 'File failed to upload.'
      end
    end

    private

    def file_upload_params
      params.require(:file_upload).permit(:attachment)
    end
  end
end
