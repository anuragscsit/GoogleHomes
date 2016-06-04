class DepositesController < ApplicationController
	before_filter :set_cache_buster
	before_action :auth_tenant

	def auth_tenant
	    redirect_to  new_tenant_registration_url unless user_signed_in?
	end

	def set_cache_buster
	   	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	    response.headers["Pragma"] = "no-cache"
	    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
	def new
		
	end

	def create
		@tenant = current_user	
	   	@house = params[:house_id]	 	
		@bed_room = params[:bed_room]
		@deposite_amount = params[:deposite]

		customer = Stripe::Customer.create(
		   	:email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		)

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_deposites_path
		else
			#UserMailer.room_rent_email(@tenant, @rent).deliver
			deposite = DepositeRent.create(house_id: @house, deposite_amount: @deposite_amount, tenant_id: @tenant.id, bed_room_id: @bed_room, deposite_date: Time.now )
			redirect_to :back, notice: 'Deposites paid successsfully.'

		end
	

	# def show
	# 	@room_rent = RoomRent.find(params[:id])
	# 	@house =  House.find(@room_rent.house_id)		
	# 	@tenant = current_user
	# end
end
