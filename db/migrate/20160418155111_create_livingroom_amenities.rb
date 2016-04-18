class CreateLivingroomAmenities < ActiveRecord::Migration
  def change
    create_table :livingroom_amenities do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
