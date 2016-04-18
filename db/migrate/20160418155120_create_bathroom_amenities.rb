class CreateBathroomAmenities < ActiveRecord::Migration
  def change
    create_table :bathroom_amenities do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
