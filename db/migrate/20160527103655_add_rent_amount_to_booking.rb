class AddRentAmountToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :rent_amount, :integer
  end
end
