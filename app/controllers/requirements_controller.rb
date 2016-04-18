class RequirementsController < ApplicationController
  def new
  	 @requirement = Requirement.new
  end

  def create

    @requirement = Requirement.new(requirement_params)
    
    @requirement.save
    if current_user.class.name=='Tenant'
    	redirect_to '/tenants/dashboard' 
	else
		redirect_to '/'
	end
  end

  private
  def requirement_params
   params.require(:requirement).permit(:name,:phone,:email,:city,:location,:room_for,:need_within)
  end
end
