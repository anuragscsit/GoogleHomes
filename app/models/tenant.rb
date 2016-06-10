class Tenant < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_one :tenant_profile
  has_many :bookings
  has_many :room_rents
  has_many :deposite_rents 
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
