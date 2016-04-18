class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :city
      t.string :location
      t.string :room_for
      t.string :need_within
      t.timestamps null: false
    end
  end
end
