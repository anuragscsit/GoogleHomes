class Owner::HouseOwnerProfileController < ApplicationController
	before_filter :authenticate_house_owner!

  def edit

  	@user = current_house_owner

     @city  = City.all
      @state  = State.all
    @house_owner_profile = current_house_owner.house_owner_profile
  end
  def update
    @user = current_house_owner
    @city  = City.all
     @state  = State.all
     @house_owner_profile = HouseOwnerProfile.find(params[:id])
    if @house_owner_profile.update_attributes(profile_params)
      redirect_to owner_house_owners_dashboard_path
    else
      render 'edit'
    end
  end
  def show

    @house_owner = current_user
    @house_owner_profile = current_user.house_owner_profile
   
  end
    

  private
  def profile_params
   params.require(:house_owner_profile).permit(:image, :DOB, :sex, :bio, :p_address, :p_city, :p_state, :p_pincode, :c_address, :c_city, :c_state, :c_pincode, :occupation, :work_detail, :subscription)
  end
end
