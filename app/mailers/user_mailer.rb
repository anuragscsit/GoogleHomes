class UserMailer < ApplicationMailer
	default from: "noreply.ghomes@gmail.com"
	
	def booking_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Sample Email')
	end
	def requirement_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Sample Email')
	end
	
end
