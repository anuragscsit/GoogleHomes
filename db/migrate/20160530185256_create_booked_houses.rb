class CreateBookedHouses < ActiveRecord::Migration
  def change
    create_table :booked_houses do |t|
      t.integer :house_id
      t.integer :tenant_id
      t.string :bed_room_id
      t.string :live_in_start_date
      t.string :booking_date
      t.integer :rent

      t.timestamps null: false
    end
  end
end
