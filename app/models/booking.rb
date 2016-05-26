class Booking < ActiveRecord::Base
	belongs_to :tenant
	belongs_to :house
end
