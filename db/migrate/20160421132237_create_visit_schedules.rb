class CreateVisitSchedules < ActiveRecord::Migration
  def change
    create_table :visit_schedules do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :date
      t.string :time

      t.timestamps null: false
    end
  end
end
