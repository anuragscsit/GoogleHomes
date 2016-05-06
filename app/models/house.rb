class House < ActiveRecord::Base
	belongs_to :house_owner

	validates :house_image, :city, :location, :latitude, :longitude, presence: true
	mount_uploaders :house_image, ImageUploader
	acts_as_mappable :default_units => :kms,:lat_column_name => :latitude, :lng_column_name => :longitude
end
