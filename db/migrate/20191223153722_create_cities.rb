class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.belongs_to :country, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
