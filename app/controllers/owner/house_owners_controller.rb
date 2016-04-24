class Owner::HouseOwnersController < ApplicationController
	before_filter :authenticate_house_owner!, except: [:show]
  def dashboard
  	if current_user.house_owner_profile.nil?
      @house_owner_profile = HouseOwnerProfile.new(house_owner_id: current_user.id)
      @house_owner_profile.save(validate: false)
    #   @house_owner = current_user
    # @houses = House.all.where(house_owner_id: current_user.id)

    else
      @house_owner_profile = current_user.house_owner_profile
      @house_owner = current_user
    @houses = House.all.where(house_owner_id: current_user.id)
    end
  end
  def show
  	@house_owner = current_user
     @house_owner_profile = current_user.house_owner_profile
  end
  def my_houses
    @house_owner = current_user
    @houses = House.all.where(house_owner_id: current_user.id)

  end
  def my_payments
  end
  
end
