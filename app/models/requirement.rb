class Requirement < ActiveRecord::Base
	validates :name, :phone, :email, :room_for, :city, :location, presence: true
end
