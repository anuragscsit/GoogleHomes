class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
    	t.string  		:name
      	t.string  		:house_type, default: '1BHK'
	  	t.string		:house_for, default: 'boys'  	
	  	t.integer  		:no_of_rooms, default: 1
	  	t.integer  		:no_of_beds, default: 1
	    t.integer  		:rent_per_room, default: 1
	    t.integer  		:rent_per_bed, default: 3000
	    t.string  		:food_preference, default: 'none' 
	    t.text  		:livingroom_amenities, array: true, default: []
	    t.text  		:bedroom_amenities, array: true, default: []
	    t.text  		:bathroom_amenities, array: true, default: []
	    t.text  		:kitchen_amenities, array: true, default: []
	    t.text  		:other_amenities, array: true, default: []
	    t.text  		:house_image, array: true, default: []
	    t.string  		:city
	    t.string  		:location
	    t.string  		:distance_from_station
	    t.integer  		:visit_count, default: 0
	    t.integer  		:house_owner_id
      	t.timestamps 	null: false
    end
  end
end
