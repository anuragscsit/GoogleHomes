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
		@move_in_date = params[:date]
		#@token_amount = params[:token].to_f
		@rent_amount = params[:rent].to_f
		@month = params[:month]
		@bed_room = params[:bed_room]
		@house = House.find(house)
		@tenant = current_user		
	end
	def booking
		@user = current_user
		UserMailer.booking_email(@user).deliver
	end

end
