class AddFieldsToHouseOwnerProfiles < ActiveRecord::Migration
  def change
  	add_column :house_owner_profiles, :first_name, :string
  	add_column :house_owner_profiles, :last_name, :string
  	add_column :house_owner_profiles, :contact_no, :string
  	add_column :house_owner_profiles, :email, :string  	
  	add_column :house_owner_profiles, :identity_proof, :string
  	add_column :house_owner_profiles, :address_proof, :string
  	add_column :house_owner_profiles, :account_holder, :string
    add_column :house_owner_profiles, :account_number, :string
    add_column :house_owner_profiles, :bank_name, :string
  	add_column :house_owner_profiles, :ifsc_code, :string
  	add_column :house_owner_profiles, :cheque, :string
  end
end
