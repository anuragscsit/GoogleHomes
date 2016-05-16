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
      redirect_to :back, notice: 'Profile updated successfully.'
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
   params.require(:house_owner_profile).permit(:image, :DOB, :sex, :bio, :contact_no, :email,
    :p_address, :p_city, :p_state, :p_pincode, :identity_proof, :address_proof,
    :occupation, :account_holder, :account_number,:bank_name,:ifsc_code,:cheque,:subscription)
  end
end
