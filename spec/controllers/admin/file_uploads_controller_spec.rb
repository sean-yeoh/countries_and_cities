require 'rails_helper'

RSpec.describe Admin::FileUploadsController, type: :controller do
  describe 'GET #index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'is successful' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'valid params' do
      let(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/attachments/countries_and_cities.csv'))) }
      let(:valid_params) { { attachment: attachment } }

      it 'creates a file upload' do
        expect {
          post :create, params: { file_upload: valid_params }
        }.to change(FileUpload, :count).by(1)
      end

      it 'redirects to admin_file_uploads_path' do
        post :create, params: { file_upload: valid_params }
        expect(response).to redirect_to(admin_file_uploads_path)
      end
    end

    context 'invalid params' do
      let(:invalid_params) { { attachment: '' } }

      it 'does not create a file upload' do
        expect {
          post :create, params: { file_upload: invalid_params }
        }.to change(FileUpload, :count).by(0)
      end

      it 'redirects to new_admin_file_upload_path' do
        post :create, params: { file_upload: invalid_params }
        expect(response).to redirect_to(new_admin_file_upload_path)
      end
    end
  end
end
