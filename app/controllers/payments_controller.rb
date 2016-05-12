class PaymentsController < ApplicationController
	before_action :auth_tenant
	def auth_tenant
	    redirect_to  new_tenant_registration_url unless user_signed_in?
	end

	def bed_confirmation
		house = params[:house_id]
		@house = House.find(house)
	end
	def confirmation
		house = params[:house_id]
		@house = House.find(house)
		@tenant= current_user
		@move_in_date = params[:date]
	end
end
