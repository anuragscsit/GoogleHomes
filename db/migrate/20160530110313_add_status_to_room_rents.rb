class AddStatusToRoomRents < ActiveRecord::Migration
  def change
  	add_column :room_rents, :status, :string, default: 'dues'
  end
end
