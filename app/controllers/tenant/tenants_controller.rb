class Tenant::TenantsController < ApplicationController
	before_filter :authenticate_tenant!
  respond_to :html, :js

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
    @tenant = current_user
     @tenant_profile = current_user.tenant_profile
  end
  
  def payments    
    @rent = RoomRent.all
  end

  def myhouse
    
   booking = Booking.where(tenant_id: current_user.id).first
   @house = House.find(booking.house_id)
  end

end
