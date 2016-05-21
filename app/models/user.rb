class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, :last_name, :contact_number, presence: true 
  # #mount_uploader :avatar, LogoUploader

  after_create :send_signup_mail
    def send_signup_mail
      UserMailer.signup_mail(self).deliver
    end


  # def should_be_house_owner_user?
  #   type == "HouseOwner"
  # end

  # def should_be_tenant_user?
  #   type == "Tenant"
  # end
 end
