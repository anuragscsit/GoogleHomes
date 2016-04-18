class CreateBedroomAmenities < ActiveRecord::Migration
  def change
    create_table :bedroom_amenities do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
