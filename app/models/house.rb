class House < ActiveRecord::Base
	belongs_to :house_owner

	mount_uploaders :house_image, ImageUploader
end
