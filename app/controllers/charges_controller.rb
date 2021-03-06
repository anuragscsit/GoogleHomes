class ChargesController < ApplicationController
	before_action :auth_tenant
	before_filter :set_cache_buster

	  def set_cache_buster
	    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	    response.headers["Pragma"] = "no-cache"
	    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	  end
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

	  	booking = Booking.create(tenant_id: @tenant.id, house_id: params[:house_id], booking_date: params[:booking_date], move_in_date: params[:move_in_date],booking_month: @month,  bed_room_id: params[:bed_room], token_money: @token_amount,rent_amount: @rent_amount)
		room_rent = RoomRent.create(tenant_id: @tenant.id, house_id: params[:house_id], rent_date: params[:booking_date],  bed_room_id: params[:bed_room],rent_amount: @token_amount,month: params[:month], status: 'paid')
		booked_house = BookedHouse.create(tenant_id: @tenant.id, house_id: params[:house_id], bed_room_id: params[:bed_room], rent: @rent_amount, live_in_start_date: params[:move_in_date], booking_date: Time.now)
		UserMailer.booking_email(@tenant).deliver
		redirect_to payment_path(booking)
	end
	

end
