class UserMailer < ApplicationMailer
	default from: "anumfp@gmail.com"
	
	def booking_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Sample Email')
	end
	def requirement_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Sample Email')
	end
	def signup_mail(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to GoogleHomes.")
  end
end
