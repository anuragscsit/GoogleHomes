class Tenant::TenantsController < ApplicationController
	before_filter :authenticate_tenant!
  respond_to :html, :js

  def dashboard    
    @booking = BookedHouse.where(tenant_id: current_user.id).first
    unless @booking.blank?
      @house = House.find(@booking.house_id)
    end
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
    @rent = RoomRent.where(tenant_id: current_user.id).all
    @dues = 0
    @rent.each do |rent|
      if rent.status == 'dues'
        @dues += rent.rent_amount 
      end
    end
    @myhouse = BookedHouse.where(tenant_id: current_user.id).first
    
  end
  
  def myhouse    
   @booking = BookedHouse.where(tenant_id: current_user.id).first 
    unless @booking.blank?
      @house = House.find(@booking.house_id)
      @deposite = @booking.rent
    end

  end
end
