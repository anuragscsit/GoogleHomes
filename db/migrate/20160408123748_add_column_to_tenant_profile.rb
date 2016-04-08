class AddColumnToTenantProfile < ActiveRecord::Migration
  def change
  	add_column :tenant_profiles, :tenant_id, :integer
  end
end
