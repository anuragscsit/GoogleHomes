class CreateDepositeRents < ActiveRecord::Migration
  def change
    create_table :deposite_rents do |t|

      t.timestamps null: false
      t.integer 	:tenant_id
      t.integer 	:house_id
      t.string 		:bed_room_id
      t.integer   	:deposite_amount
      t.string 		:deposite_date
    end
  end
end
