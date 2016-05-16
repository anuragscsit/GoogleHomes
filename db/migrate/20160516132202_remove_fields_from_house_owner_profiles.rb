class RemoveFieldsFromHouseOwnerProfiles < ActiveRecord::Migration
  def change
  	remove_column :house_owner_profiles, :work_detail
  	remove_column :house_owner_profiles, :c_address
  	remove_column :house_owner_profiles, :c_city
  	remove_column :house_owner_profiles, :c_state
  	remove_column :house_owner_profiles, :c_pincode
  	remove_column :house_owner_profiles, :name
  end
end
