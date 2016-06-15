class House < ActiveRecord::Base
	belongs_to :house_owner
	has_many :bookings
	has_many :deposite_rents
	has_many :room_rents
	has_many :tenants 
	has_many :visit_schedules
	has_many :booked_houses

	validates :house_image, :city, :location, :latitude, :longitude, presence: true
	
	mount_uploaders :house_image, ImageUploader
	
	acts_as_mappable :default_units => :kms,:lat_column_name => :latitude, :lng_column_name => :longitude

end
