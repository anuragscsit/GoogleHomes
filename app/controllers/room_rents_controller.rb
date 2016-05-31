class RoomRentsController < ApplicationController
	def new
		
	end

	def create
		@tenant = current_user	
  		@id = params[:id]
	   	@house = params[:house_id]	 	
		@bed_room = params[:bed_room]
		@rent_amount = params[:rent].to_f
		@month = params[:month]

		customer = Stripe::Customer.create(
		   	:email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		)

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_payment_path
		else
			
		  	@room_rent = RoomRent.where(id: params[:id]).limit(1).update_all(status: 'paid',rent_date: Time.now) 
		  	@rent = RoomRent.find(params[:id])
			UserMailer.room_rent_email(@tenant, @rent).deliver
			redirect_to room_rent_path(params[:id])

		end
	

	def show
		@room_rent = RoomRent.find(params[:id])
		@house =  House.find(@room_rent.house_id)		
		@tenant = current_user
	end
end
