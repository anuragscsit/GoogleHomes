class Tenant::TenantProfileController < ApplicationController
	before_filter :authenticate_tenant!
  def edit
  	@user = current_tenant
     @city  = City.all
      @state  = State.all
    @tenant_profile = current_tenant.tenant_profile
  end
  def update
    @user = current_tenant
    @city  = City.all
     @state  = State.all
     @tenant_profile = TenantProfile.find(params[:id])
    if @tenant_profile.update_attributes(profile_params)
      redirect_to :back
    else
      render 'edit'
    end
  end
  def show

    @tenant = current_user
    @tenant_profile = current_user.tenant_profile
   
  end
    

  private
  def profile_params
   params.require(:tenant_profile).permit(:first_name,:last_name,:email,:contact_no,:image,:DOB,:sex,
    :identity_proof,:address_proof,
    :p_address,:p_city,:p_state,:p_pincode,
    :occupation,:orgnization,:office_email,:years_of_employement,:employment_proof,
    :account_holder,:account_number,:bank_name,:ifsc_code,:cheque,:bank_name,
    :emergency_person_name,:emergency_person_contact,:emergency_person_relationship,:emergency_person_address
    )
  end
end
