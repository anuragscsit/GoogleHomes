class RemoveFieldsFromTenantProfiles < ActiveRecord::Migration
  def change
  	remove_column :tenant_profiles, :occupation
  	remove_column :tenant_profiles, :work_place
  	remove_column :tenant_profiles, :c_address
  	remove_column :tenant_profiles, :c_city
  	remove_column :tenant_profiles, :c_state
  	remove_column :tenant_profiles, :c_pincode
  	remove_column :tenant_profiles, :father_name
  end
end
