class TenantProfile < ActiveRecord::Base
	belongs_to :tenant
	def full_address
		p_address + " " + p_city
	end
end
