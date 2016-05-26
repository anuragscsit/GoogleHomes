class CreateRoomRents < ActiveRecord::Migration
  def change
    create_table :room_rents do |t|

      t.timestamps null: false
      t.integer 	:tenant_id
      t.integer 	:house_id
      t.string 		:bed_room_id
      t.integer   	:rent_amount
      t.string 		:month
      t.string 		:rent_date
      
    end
  end
end
