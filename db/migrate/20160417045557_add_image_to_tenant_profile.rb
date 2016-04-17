class AddImageToTenantProfile < ActiveRecord::Migration
  def change
    add_column :tenant_profiles, :image, :string
  end
end
