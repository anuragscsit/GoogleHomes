class HouseOwnerProfile < ActiveRecord::Base
	belongs_to :house_owner
	
	def full_permamnent_address
		l = ''
		l << p_address if p_address && !p_address.blank?
		l<< ' '
		l << p_city if p_city && !p_city.blank?
		l<< ' '
		l << p_state if p_state && !p_state.blank?
  	end
  # 	def full_corespondence_address
  # 		l = ''
		# l << c_address if c_address && !c_address.blank?
		# l << c_city if c_city && !c_city.blank?
		# l << c_state if c_state && !c_state.blank?
  # 	end

  	# validates :DOB, :sex, :p_address, :p_city, :p_state, :c_address, :c_city, :c_state, presence: true
  	mount_uploader :image, ImageUploader
  	mount_uploader :address_proof, ImageUploader
  	mount_uploader :identity_proof, ImageUploader
  	mount_uploader :cheque, ImageUploader
end
