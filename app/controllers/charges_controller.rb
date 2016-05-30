class ChargesController < ApplicationController
	before_action :auth_tenant

	def auth_tenant
	    redirect_to  new_tenant_registration_url unless user_signed_in?
	end

	def new

	end
	def show
		@booking = Booking.find(params[:id])
		
	end
	def create
	  # Amount in cents
	  	@tenant = current_user	
	 	@house = params[:house_id]
	 	
		@bed_room = params[:bed_room]
		@token_amount = params[:token].to_f
		@move_in_date = params[:move_in_date]
		@rent_amount = params[:rent].to_f
		@month = params[:month]
		@booking_date = params[:booking_date]
		
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	else

	  	booking = Booking.create(tenant_id: @tenant.id, house_id: params[:house_id], booking_date: params[:booking_date], move_in_date: params[:move_in_date],  bed_room_id: params[:bed_room], token_money: @token_amount,rent_amount: @token_amount)
		room_rent = RoomRent.create(tenant_id: @tenant.id, house_id: params[:house_id], rent_date: params[:booking_date],  bed_room_id: params[:bed_room],rent_amount: @token_amount,month: params[:month], status: 'paid')
		redirect_to payment_path(booking)
	end
	

end
