class UserMailer < ApplicationMailer
	default from: "anumfp@gmail.com"
	
	def booking_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'GoogleHomes house booking')
	end
	def requirement_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Your House requirement')
	end
	def signup_mail(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to GoogleHomes.")
  end

  def monthly_rent_email(user,rent)
    @user = user
    @rent = rent
    mail(:to => @user.email, :subject => "Monthly room rent reminder..")
  end

  def room_rent_email(user,rent)
  	@user = user
    @rent = rent
    mail(:to => @user.email, :subject => "Room rent payment")
  end
end
