class AddSubscriptionToHouseOwnerProfile < ActiveRecord::Migration
  def change
    add_column :house_owner_profiles, :subscription, :boolean, default: false
  end
end
