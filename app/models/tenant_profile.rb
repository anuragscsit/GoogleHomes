class TenantProfile < ActiveRecord::Base
	belongs_to :tenant
	def full_permamnent_address
		l = ''
		l << p_address if p_address && !p_address.blank?
		l << p_city if p_city && !p_city.blank?
		l << p_state if p_state && !p_state.blank?
  	end

  	#validates :DOB, :sex, :p_address, :p_city, :p_state, presence: true
  	mount_uploader :image, ImageUploader
  	mount_uploader :address_proof, ImageUploader
  	mount_uploader :identity_proof, ImageUploader
  	mount_uploader :cheque, ImageUploader
  	mount_uploader :employment_proof, ImageUploader
end
