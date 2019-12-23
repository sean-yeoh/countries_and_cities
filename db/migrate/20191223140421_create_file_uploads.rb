class CreateFileUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :file_uploads do |t|
      t.integer :status, default: 0
      t.text :attachment_data
      t.timestamps
    end
  end
end
