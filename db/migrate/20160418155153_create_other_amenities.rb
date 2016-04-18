class CreateOtherAmenities < ActiveRecord::Migration
  def change
    create_table :other_amenities do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
