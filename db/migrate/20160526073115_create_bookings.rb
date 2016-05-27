class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

      t.timestamps null: false
      t.integer 	:tenant_id
      t.integer 	:house_id
      t.string 		:bed_room_id
      t.string 		:booking_date
      t.string 		:move_in_date
      t.integer   :token_money
    end
  end
end
