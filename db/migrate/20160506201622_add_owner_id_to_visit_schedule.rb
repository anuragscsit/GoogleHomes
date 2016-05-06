class AddOwnerIdToVisitSchedule < ActiveRecord::Migration
  def change
    add_column :visit_schedules, :house_owner_id, :integer
    add_column :visit_schedules, :house_id, :integer
  end
end
