class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :tenant_id
      t.text :message
      t.integer :house_id

      t.timestamps null: false
    end
  end
end
