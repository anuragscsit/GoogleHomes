class AddNameToHouseOwnerProfile < ActiveRecord::Migration
  def change
    add_column :house_owner_profiles, :name, :string
  end
end
