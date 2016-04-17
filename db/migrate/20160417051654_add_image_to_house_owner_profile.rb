class AddImageToHouseOwnerProfile < ActiveRecord::Migration
  def change
    add_column :house_owner_profiles, :image, :string
  end
end
