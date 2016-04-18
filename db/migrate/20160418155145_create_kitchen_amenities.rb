class CreateKitchenAmenities < ActiveRecord::Migration
  def change
    create_table :kitchen_amenities do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
