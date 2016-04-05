class HouseOwnerProfileController < ApplicationController
  def edit
  	@user = current_house_owner
  end
  def update
  end
end
