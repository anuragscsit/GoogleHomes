class TenantProfile < ActiveRecord::Base
	belongs_to :tenant
	def full_permamnent_address
		l = ''
		l << p_address if p_address && !p_address.blank?
		l << p_city if p_city && !p_city.blank?
		l << p_state if p_state && !p_state.blank?
  	end
  	def full_corespondence_address
  		l = ''
		l << c_address if c_address && !c_address.blank?
		l << c_city if c_city && !c_city.blank?
		l << c_state if c_state && !c_state.blank?
  	end
  	mount_uploader :image, ImageUploader
end
