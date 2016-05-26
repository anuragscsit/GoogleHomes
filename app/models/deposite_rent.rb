class DepositeRent < ActiveRecord::Base
	belongs_to :house
	belongs_to :tenant
end
