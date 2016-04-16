class HouseOwnersController < ApplicationController
	before_filter :authenticate_house_owner!
  def dashboard
  	if current_user.house_owner_profile.nil?
      @house_owner_profile = HouseOwnerProfile.new(house_owner_id: current_user.id)
      @house_owner_profile.save(validate: false)
    else
      @house_owner_profile = current_user.house_owner_profile
    end
  end
  def show
  	@house_owner = current_user
     @house_owner_profile = current_user.house_owner_profile
  end
  
end
