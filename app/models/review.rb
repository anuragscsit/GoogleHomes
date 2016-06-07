class Review < ActiveRecord::Base
	belongs_to :house
	belongs to :tenant
end
