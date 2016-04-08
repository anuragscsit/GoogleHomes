class CreateTenantProfiles < ActiveRecord::Migration
  def change
    create_table :tenant_profiles do |t|
      t.date :DOB

      t.timestamps null: false
     
	    t.string   :sex
	    t.text     :bio
	    t.string   :occupation
	    t.string   :work_place
	    t.string   :father_name
	    t.string   :p_address
	    t.string   :p_city
	    t.string   :p_state
	    t.integer  :p_pincode
	    t.string   :c_address
	    t.string   :c_city
	    t.string   :c_state
	    t.integer  :c_pincode
	   
	    t.integer  :tenant_id
    
    end
  end
end
