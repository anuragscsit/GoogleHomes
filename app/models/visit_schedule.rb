class VisitSchedule < ActiveRecord::Base

	validates :name, :email, :phone, :date, :time, presence: true
end
