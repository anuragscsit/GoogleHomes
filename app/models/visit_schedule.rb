class VisitSchedule < ActiveRecord::Base
	belongs_to :house
	belongs_to :house_owner
	validates :name, :email, :phone, :date, :time, presence: true
end
