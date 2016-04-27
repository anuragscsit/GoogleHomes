class VisitSchedule < ActiveRecord::Base

	validates :name, :email, :phone, :p_city, :date, :time, presence: true
end
