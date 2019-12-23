require 'csv'

class FileUploadService
  include ActiveModel::Model
  attr_accessor :file, :file_upload

  validates :file, presence: true
  validate :file_extension

  def initialize(params = {})
    @file = params[:attachment]
    @file_upload = FileUpload.new(params)
  end

  def save!
    @file_upload.save
    @file_upload.uploading!

    ::CSV.foreach(file.path, headers: true) do |row|
      country = Country.find_or_initialize_by(name: row[0])
      country.save

      city = country.cities.find_or_initialize_by(name: row[1])
      city.save
    end

    @file_upload.uploaded!
  end

  private

  def file_extension
    errors.add(:file, 'must be in xlsx format') if file_ext != '.csv'
  end

  def file_ext
    return if file.blank?

    File.extname(file.original_filename)
  end
end
