class HouseOwnerProfile < ActiveRecord::Base
	belongs_to :house_owner
	def full_address
    	p_address + " " + p_city + " " + p_state
  	end
end
