class CreateOwnerPayments < ActiveRecord::Migration
  def change
    create_table :owner_payments do |t|
      t.integer :house_owner_id
      t.integer :house_id
      t.integer :tenant_id
      t.float :amount
      t.string :month
      t.string :year
      t.string :date

      t.timestamps null: false
    end
  end
end
