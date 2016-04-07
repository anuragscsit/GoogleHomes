class TenantProfileController < ApplicationController
	before_filter :authenticate_tenant!
  def edit
  	@user = current_tenant
    @tenant_profile = current_tenant.tenant_profile
  end
  def update
    @user = current_tenant
     @tenant_profile = TenantProfile.find(params[:id])
    if @tenant_profile.update_attributes(profile_params)
      redirect_to dashboard_tenants_path
    else
      render 'edit'
    end
  end

  private
  def profile_params
   params.require(:tenant_profile).permit(:DOB,:sex,:p_address,:p_city,:p_state,:p_pincode,:c_address,:c_city,:c_state,:c_pincode,:father_name,:occupation,:work_place)
  end
end
