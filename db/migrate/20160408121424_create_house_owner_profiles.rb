class CreateHouseOwnerProfiles < ActiveRecord::Migration
  def change
    create_table :house_owner_profiles do |t|
    t.date :DOB
    t.string   :sex
    t.text     :bio
    t.string   :occupation
    t.string   :work_detail
    t.string   :p_address
    t.string   :p_city
    t.string   :p_state
    t.integer  :p_pincode
    t.string   :c_address
    t.string   :c_city
    t.string   :c_state
    t.integer  :c_pincode
    t.integer  :house_owner_id
    t.timestamps null: false
    end
  end
end
