class AddMonthToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :booking_month, :integer
  end
end
