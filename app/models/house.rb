class House < ActiveRecord::Base
	belongs_to :house_owner

	validates :house_image, :city, :location, :latitude, :longitude, presence: true
	mount_uploaders :house_image, ImageUploader
end
