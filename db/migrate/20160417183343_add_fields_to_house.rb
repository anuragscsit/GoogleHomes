class AddFieldsToHouse < ActiveRecord::Migration
  def change
  	add_column :houses, :type, :string, default: '1BHK'
  	add_column :houses, :house_for, :string, default: 'boys'  	
  	add_column :houses, :no_of_rooms, :integer, default: 1
  	add_column :houses, :bed, :integer, default: 1
    add_column :houses, :rent_per_room, :integer, default: 1
    add_column :houses, :rent_per_bed, :integer, default: 3000
    add_column :houses, :food_preference, :string , default: 'none' 
    add_column :houses, :livingroom_amenities, :text, array: true, default: []
    add_column :houses, :bedroom_amenities, :text, array: true, default: []
    add_column :houses, :bathroom_amenities, :text, array: true, default: []
    add_column :houses, :kitchen_amenities, :text, array: true, default: []
    add_column :houses, :house_image, :text, array: true, default: []
    add_column :houses, :distance_from_station, :string
    add_column :houses, :visit_count, :integer, default: 0
    add_column :houses, :house_owner_id, :integer
  end
end
