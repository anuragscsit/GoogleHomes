 require 'rubygems'
 require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new

# scheduler.cron '5 10 * * *' do
#   # do something every day, five minutes after midnight
#   # (see "man 5 crontab" in your terminal)
# end

scheduler.cron('01 08 01 * *') do
	@booking = Booking.all
	@booking.each do |rent|
    @user = User.find(rent.tenant_id)
    	room_rent = RoomRent.create(tenant_id: rent.tenant_id, house_id: rent.house_id,  bed_room_id: rent.bed_room_id,rent_amount: rent.rent_amount,month: Time.now.month )
		UserMailer.monthly_rent_email(@user,rent).deliver
	end
end