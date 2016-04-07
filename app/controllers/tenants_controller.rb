class TenantsController < ApplicationController
	before_filter :authenticate_tenant!
  def dashboard
  	
    @tenant = current_user
    
    if current_user.tenant_profile.nil?
      @tenant_profile = TenantProfile.new(tenant_id: current_user.id)
      @tenant_profile.save(validate: false)
    else
      @tenant_profile = current_user.tenant_profile
    end
  end

  def show
  end

end
