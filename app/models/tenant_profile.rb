class TenantProfile < ActiveRecord::Base
	belongs_to :tenant
	def full_permamnent_address
    	 p_address + " " + p_city + " " +p_state
  	end
  	def full_corespondence_address
  		 c_address + " " + c_city + " " +c_state
  	end
end
