class AddSubscriptionToTenantProfile < ActiveRecord::Migration
  def change
    add_column :tenant_profiles, :subscription, :boolean, default: true
  end
end
